import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() {
        self.val = 0;
        self.next = nil;
    }
    public init(_ val: Int) {
        self.val = val;
        self.next = nil;
    }
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val;
        self.next = next;
    }
 }

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let head = ListNode(0)
    var p = l1
    var q = l2
    var curr = head
    var carry = 0
    
    while p != nil || q != nil {
        let x = p?.val ?? 0
        let y = q?.val ?? 0
        let sum = carry + x + y
        carry = sum / 10
        curr.next = ListNode(sum % 10)
        curr = curr.next!
        if p != nil {
            p = p!.next
        }
        if q != nil {
            q = q!.next
        }
    }
    if carry > 0 {
        curr.next = ListNode(carry)
    }
    return head.next
}

let list1 = ListNode(2, ListNode(4, ListNode(9)))
let list2 = ListNode(5, ListNode(6, ListNode(4, ListNode(9))))
let returnList = addTwoNumbers(list1, list2)
var currentList = returnList
while currentList != nil {
    print(currentList!.val)
    currentList = currentList!.next
}
