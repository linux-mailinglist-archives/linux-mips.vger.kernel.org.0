Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C62843AA8E2
	for <lists+linux-mips@lfdr.de>; Thu, 17 Jun 2021 04:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231283AbhFQCSA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Jun 2021 22:18:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbhFQCSA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 16 Jun 2021 22:18:00 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 637D6C061574
        for <linux-mips@vger.kernel.org>; Wed, 16 Jun 2021 19:15:52 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id l64so1382025ioa.7
        for <linux-mips@vger.kernel.org>; Wed, 16 Jun 2021 19:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=0Q3ZKPgiakfSmhgk1RVtik80qD52peQ/rHR1wfh2NDc=;
        b=jMYNSpbABIwhRQTMgbhJ3dUtx3a2fJDDs5I7CjmsD+Ashtk9+oz3yapHp5CRnqrSBm
         FRAnx/uQdZVpgMNhn8+4yJTY60LTA2sbb7wOKkYP5FqEUBdeX8TG8q7E3klITbp8e2tn
         PCjFOanhZLZa94ww4qvjziRpBzDD1xv/3WkJBcqZ0x9EBg+XYXwiT2OdrAzQ3mr5fdTq
         +Xfy0rqt7L/bXgIuE7nIrb1Wz6cFR5UdILZB4jNkMAgwcaVQXPaLzw7SdWt7EdnKTBbo
         EFQK4D/B4w0GfYtlKq+sChR4Zl2N1T89F4uLkzmHDr7y9yUhO5MTscEpCeVgHedyXCjC
         WwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=0Q3ZKPgiakfSmhgk1RVtik80qD52peQ/rHR1wfh2NDc=;
        b=PmKzHlLz1/Y+25jseZRUgi/katglg9MtZdv+kJz1vAbmEOVMNw5RzbniBLCDYmkvgZ
         bhecSjuGIUtTvUWZCKgrhEAeDu8BM2PruSxm2Fxk73MhyQjjmzPdLk7YUY57SUOmcgg+
         +BKAgzI2mpyIvHiNxiPXryt1eUG7Y7ooRf1FPb/m2p31xyIVWAnJJYz9f/1LFa5FLdpp
         V2hXA0eswerBCpjYwnwDBRx1+8ee2ST4snjBjCq/O6dbWsIXXTqxaHGpTUepRBD+MQnm
         w//PJRxaXjCmOrbGFGsD+A+SHIgNyMy+7e7A8bxvu/ysXcKl1aNHubZ5C/sbhXb/oL9U
         qdxg==
X-Gm-Message-State: AOAM531K6z1CYlCkW+emWIfGps2vdvoHszA7kJKvXlZ0IyeLWhZqcnYl
        Lz/vfKfOUAHpMlfM47CCscXqaI/3We9PMiiq7sbAE2T4kKzw2xlE
X-Google-Smtp-Source: ABdhPJw1reADWKaNkrCFzy53yebKvQEquDSNgmVPHMZccSRQgu7vlu3bwT4XTW70bQIe4PNp0BSywHaMQy9qU7ZYAUs=
X-Received: by 2002:a6b:d61a:: with SMTP id w26mr1835068ioa.204.1623896151894;
 Wed, 16 Jun 2021 19:15:51 -0700 (PDT)
MIME-Version: 1.0
From:   Tony Ambardar <tony.ambardar@gmail.com>
Date:   Wed, 16 Jun 2021 19:15:41 -0700
Message-ID: <CAPGftE-dQhsjJAWK47SD6m5C30RBk1Pc=q9sWFM1pAKHmaFyeg@mail.gmail.com>
Subject: Help with SLT insn under MIPS R6
To:     linux-mips@vger.kernel.org
Cc:     Paul Burton <paulburton@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

While working on a MIPS32 BPF JIT and testing under QEMU, I've
encountered some problems related to the behaviour of the SLT[I][U]
opcode under MIPS ISA R6, and would appreciate some help/insight
clarifying various online and documented descriptions.

In "Introduction to the MIPS32 Architecture"
(MD00082-2B-MIPS32INT-AFP-06.01), some wording states:
"CPU truth values ... are replaced by Release 6 instructions that
generate truth values of all zeroes or all ones (suitable for logical
operations involving masks) and interpret all zeroes or any non-zero
bit as true or false ..."

This change is also echoed elsewhere online:
  - https://www.linuxsecrets.com/linux-mips-wiki/MIPS_Release_6.html#MIPS32=
.2F64_Release_6
  - https://en.wikipedia.org/wiki/MIPS_architecture#MIPS32/MIPS64

However, in "The MIPS32=C2=AE Instruction Set Manual"
(MD00086-2B-MIPS32BIS-AFP-6.06), the SLTU insn *is not* specified to
generate all-ones truth values.

Generating all-ones truth values for SLTU impacts things like
carry-addition code written for MIPS32R6, such as in my BPF JIT
R6-support code. Curiously, while testing this under QEMU I saw many
test-case failures, and debugging seemed to show QEMU not generating
all-ones truth values when emulating the R6 ISA.

Thus, the key questions:
1. What is the correct/expected output of SLT under the MIPS ISA R6?
2. Does QEMU properly emulate SLT under ISA R6? If not, how do other
developers reliably test for R6 compliance?

Thanks in advance for any help,
Tony
