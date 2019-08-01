package tree

import (
	"errors"
	"sort"
)

// Node type defines a node of a tree
type Node struct {
	ID       int
	Children []*Node
}

// Add method adds a Record to the Node hierarchy
func (n *Node) Add(r Record) error {
	if n.ID >= r.ID || n.ID > r.Parent {
		return errors.New("Invalid Child ID")
	}
	if n.ID == r.Parent {
		child := Node{ID: r.ID}
		if n.Children == nil {
			n.Children = []*Node{}
		} else {
			for _, child := range n.Children {
				if child.ID == r.ID {
					return errors.New("Duplicate Child ID")
				}
			}
		}
		n.Children = append(n.Children, &child)
	} else { // n.ID < r.Parent
		for _, child := range n.Children {
			if err := child.Add(r); err == nil {
				return nil
			}
		}
		return errors.New("Parent not found")
	}
	return nil
}

// Record type defines a record to be restructured
type Record struct {
	ID     int
	Parent int
}

// RecordList type defines a list of records that can be sorted
type RecordList []Record

// Len method returns the length of RecordList
func (l RecordList) Len() int {
	return len(l)
}

// Less method verifies if the element i is lesser than the element j of RecordList
func (l RecordList) Less(i, j int) bool {
	return l[i].ID < l[j].ID
}

// Swap method swaps the position of element i and j of RecordList
func (l RecordList) Swap(i, j int) {
	l[i], l[j] = l[j], l[i]
}

// Build function restructures the RecordList in a tree structure
func Build(records RecordList) (*Node, error) {
	if records.Len() == 0 {
		return nil, nil
	}
	sort.Sort(records)
	root, records := records[0], records[1:]
	if root.ID != 0 || root.Parent > 0 {
		return nil, errors.New("Invalid root")
	}
	node := Node{ID: 0}
	for i, record := range records {
		if record.ID != i+1 {
			return nil, errors.New("Non-continuous Tree")
		}
		if err := node.Add(record); err != nil {
			return nil, err
		}
	}
	return &node, nil
}
