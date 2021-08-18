Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31ED33EF69B
	for <lists+linux-mips@lfdr.de>; Wed, 18 Aug 2021 02:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237105AbhHRAM7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Aug 2021 20:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236863AbhHRAM6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 17 Aug 2021 20:12:58 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F679C0617AD
        for <linux-mips@vger.kernel.org>; Tue, 17 Aug 2021 17:12:24 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id p71-20020a25424a0000b029056092741626so927262yba.19
        for <linux-mips@vger.kernel.org>; Tue, 17 Aug 2021 17:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=reply-to:date:message-id:mime-version:subject:from:to:cc;
        bh=JTnvoGQPkzSY6sftzgGOupURPM7Ep9m5Wy1FXJgvwt8=;
        b=fyeUao6f185gl09ZYsAcdA7yqynUAarWJxtZWYjEguvdRD3P7FagvzAviDCjWFv9rL
         hkTapS9n0MejNBYX2Q5yho2bHtiNxihusqY+CxIRaDELLoNGX+rLqUW5lJrnEo/Mnm0e
         tdASNb+sSeLR5tAQ8VguxhX7xu/etGncJN6MqDGLgROWk+szWdS+QKryOwUk7KtLD9kc
         VIB77hKdU4R/GCrKDGfJV45g5i0FA1HckPWMpfpc96fmGXzvuG0a3+dtXdvgVNUn85ch
         0fl8hUM/hx3+Jt5MkdC3np01fB7+YS8SSyrKtslPuKN3R0rpXVrltaB4IU7mkT2jcj3C
         EtqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:date:message-id:mime-version:subject
         :from:to:cc;
        bh=JTnvoGQPkzSY6sftzgGOupURPM7Ep9m5Wy1FXJgvwt8=;
        b=ptXgOzLTsoMvOhL10ZN54ctyhWqz8UzGst22GrpHCAzsJ+cj/eHJc8eIlo45moCRSW
         wIgoNTmn2+KzFEahncXNhx/NZ6JMTl9jlPtq8b2lXbqCKhlICnpRGorsecS2BXUM7+j7
         6qzVB9DiPWe/NH1Yj1v9mTCLPOdurocNW3SCLt+CffOxnI1g0jS9avBp972uhps6R7aZ
         NK4s70Dq9mD6dOK3T9NSLBEcxp10aTBXU++ikuk5cql0nBsm4NFjQu4AOIxAgKlkbNv0
         +Q/wPmydUlq0twAW81QxvP4YlKtm90DtMKIC8Rny5zTuXBRQOlMyg5nxAmNnsR5LFB4a
         3fTQ==
X-Gm-Message-State: AOAM532uYMbV3ZM2fXlM6dWBFlYJmAqR7HshSTFBNJqUZbtpoTMTRAVw
        79Dq5MQjVuDTIBUyHyWmcoeS/Db6wNg=
X-Google-Smtp-Source: ABdhPJx/sMOLc7HCSgjqqqa43Z4/KNb0h6Qo8TurrCfZhkWk410D/oOp9imaDI4DVCS6cpPHQf2wmOXKS3s=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:158e:55a:74dd:5197])
 (user=seanjc job=sendgmr) by 2002:a25:7743:: with SMTP id s64mr7874463ybc.214.1629245543687;
 Tue, 17 Aug 2021 17:12:23 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Tue, 17 Aug 2021 17:12:05 -0700
Message-Id: <20210818001210.4073390-1-seanjc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
Subject: [PATCH 0/5] KVM: rseq: Fix and a test for a KVM+rseq bug
From:   Sean Christopherson <seanjc@google.com>
To:     Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Oleg Nesterov <oleg@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Andy Lutomirski <luto@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Shuah Khan <shuah@kernel.org>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Peter Foley <pefoley@google.com>,
        Shakeel Butt <shakeelb@google.com>,
        Sean Christopherson <seanjc@google.com>,
        Ben Gardon <bgardon@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Patch 1 fixes a KVM+rseq bug where KVM's handling of TIF_NOTIFY_RESUME,
e.g. for task migration, clears the flag without informing rseq and leads
to stale data in userspace's rseq struct.

Patch 2 is a cleanup to try and make future bugs less likely.  It's also
a baby step towards moving and renaming tracehook_notify_resume() since
it has nothing to do with tracing.  It kills me to not do the move/rename
as part of this series, but having a dedicated series/discussion seems
more appropriate given the sheer number of architectures that call
tracehook_notify_resume() and the lack of an obvious home for the code.

Patch 3 is a fix/cleanup to stop overriding x86's unistd_{32,64}.h when
the include path (intentionally) omits tools' uapi headers.  KVM's
selftests do exactly that so that they can pick up the uapi headers from
the installed kernel headers, and still use various tools/ headers that
mirror kernel code, e.g. linux/types.h.  This allows the new test in
patch 4 to reference __NR_rseq without having to manually define it.

Patch 4 is a regression test for the KVM+rseq bug.

Patch 5 is a cleanup made possible by patch 3.


Sean Christopherson (5):
  KVM: rseq: Update rseq when processing NOTIFY_RESUME on xfer to KVM
    guest
  entry: rseq: Call rseq_handle_notify_resume() in
    tracehook_notify_resume()
  tools: Move x86 syscall number fallbacks to .../uapi/
  KVM: selftests: Add a test for KVM_RUN+rseq to detect task migration
    bugs
  KVM: selftests: Remove __NR_userfaultfd syscall fallback

 arch/arm/kernel/signal.c                      |   1 -
 arch/arm64/kernel/signal.c                    |   1 -
 arch/csky/kernel/signal.c                     |   4 +-
 arch/mips/kernel/signal.c                     |   4 +-
 arch/powerpc/kernel/signal.c                  |   4 +-
 arch/s390/kernel/signal.c                     |   1 -
 include/linux/tracehook.h                     |   2 +
 kernel/entry/common.c                         |   4 +-
 kernel/rseq.c                                 |   4 +-
 .../x86/include/{ => uapi}/asm/unistd_32.h    |   0
 .../x86/include/{ => uapi}/asm/unistd_64.h    |   3 -
 tools/testing/selftests/kvm/.gitignore        |   1 +
 tools/testing/selftests/kvm/Makefile          |   3 +
 tools/testing/selftests/kvm/rseq_test.c       | 131 ++++++++++++++++++
 14 files changed, 143 insertions(+), 20 deletions(-)
 rename tools/arch/x86/include/{ => uapi}/asm/unistd_32.h (100%)
 rename tools/arch/x86/include/{ => uapi}/asm/unistd_64.h (83%)
 create mode 100644 tools/testing/selftests/kvm/rseq_test.c

-- 
2.33.0.rc1.237.g0d66db33f3-goog

