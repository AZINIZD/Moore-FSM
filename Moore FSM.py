class SequenceDetectorMoore:
    def __init__(self):
        # Initialize the state
        self.state = 0  # Corresponds to S0
        self.S0 = 0
        self.S1 = 1
        self.S2 = 2
        self.S3 = 3

    def next_state(self, x):
        """Update the state based on the input x."""
        if self.state == self.S0:
            if x:
                self.state = self.S1
            else:
                self.state = self.S0
        elif self.state == self.S1:
            if x:
                self.state = self.S2
            else:
                self.state = self.S0
        elif self.state == self.S2:
            if x:
                self.state = self.S3
            else:
                self.state = self.S0
        elif self.state == self.S3:
            if x:
                self.state = self.S3
            else:
                self.state = self.S0

    def output(self):
        """Return the output y based on the current state."""
        return self.state == self.S3

    def process_sequence(self, sequence):
        """Process a sequence of bits and return the output for each bit."""
        outputs = []
        for x in sequence:
            self.next_state(x)
            outputs.append(self.output())
        return outputs

# Example usage
if __name__ == "__main__":
    detector = SequenceDetectorMoore()
    input_sequence = [1, 1, 1, 0, 1, 1, 1, 1, 0]  # Sample input sequence
    outputs = detector.process_sequence(input_sequence)

    for bit, output in zip(input_sequence, outputs):
        print(f"Input: {bit}, Output: {output}")
        
