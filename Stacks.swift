// Experimenting with three kinds of stacks

import SwiftUI

struct Stacks: View
{
    var body: some View
    {
        ZStack(alignment: .center)
        {
            Rectangle()
                .fill(Color.red)
                .cornerRadius(50)
                .frame(width: 350, height: 350)

            VStack(spacing: 50)
            {
                HStack(spacing: 50)
                {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 100, height: 100)

                    Circle()
                        .fill(Color.white)
                        .frame(width: 100, height: 100)
                }

                Rectangle()
                    .fill(Color.yellow)
                    .frame(width: 150, height: 100)
            }
        }
    }
}

struct Stacks_Previews: PreviewProvider
{
    static var previews: some View
    {
        Stacks()
    }
}
