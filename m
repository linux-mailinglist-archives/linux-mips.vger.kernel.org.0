Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3D32819F
	for <lists+linux-mips@lfdr.de>; Thu, 23 May 2019 17:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731093AbfEWPs6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 May 2019 11:48:58 -0400
Received: from mail-it1-f196.google.com ([209.85.166.196]:51556 "EHLO
        mail-it1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730790AbfEWPs6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 May 2019 11:48:58 -0400
Received: by mail-it1-f196.google.com with SMTP id m3so10548363itl.1
        for <linux-mips@vger.kernel.org>; Thu, 23 May 2019 08:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brauner.io; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qdhvyBV5eCUYlrhtprSXvsuKWr+yBvkV1a8SbE6AS60=;
        b=PHFjvm23caZGYr4uiNYmJAibVBzXG/G68GWrR3KEL+4ubMa1yG52PY5KbD5HgQ94DS
         UYyKxymb5fEjGeKdBKbPovN4lf1X37+9FR6/IKpeONALi6Pb6Ba6dCiyKGGLwyh/Thfo
         TBBGEFZCAqITH+9ysPxJvr8e5RDKlYMuQAQ4Vb/7fDfahu0Q9wvBEskpiiSkZAzXwDg0
         HO3ghqNF44h7BZNoCoOH48Br+sXnnPudMYWxblMnUowckCT/7+BYIAVlMi8aQoMmK9+g
         efMaCVYPokznZ4LdQiFStyRq1hGeIabBZ6GksyGUTQGFowjocl7wKgtLYpmWvu2C2iki
         T5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qdhvyBV5eCUYlrhtprSXvsuKWr+yBvkV1a8SbE6AS60=;
        b=knixXKzpRiC0TglCgr7EKrqq+Dp0PcsQGVZZc8n0Bae1BvQ5HQmQ105/VM5rp+j8qO
         UM8Og65w/RKjm6GD5hGs4jInbCgdq6A/NlWyFgmsujAIZEK2wBjkxEia2KdywzAS0wVj
         FGOo+je1dg3SDmZPKq7Qt4HUDX6ISxmjC+RGh8Wt3xIK3dHliFssAyGDkKYcGwt6lHlS
         Py8aAzh6c+qEmmBaRfx+3gprU51ozmvcK1R4Sqq0dD4BsLSP77K29ya7N/rFLREVN03J
         XsdrMyBeROR7WPnWlqFhs2V5ws5HO4nNiFVi6qAYb2jAguwQDP+wIPB/rGMDGfsNqJ/m
         zi0A==
X-Gm-Message-State: APjAAAXiCnr0DucgHtbXwztG2S8QlyOOi0mhlPlQ1fVRJU13giC3yxEt
        AVJL2+mmihRpfNVSQuaP7Hj/Uw==
X-Google-Smtp-Source: APXvYqys6QK/iakUDj+Sh+Ogl2zyh29ySOoi4FUzRp4yc77NrnF9Vcc9AkfEItA9paeABX2UyF+z5Q==
X-Received: by 2002:a24:6212:: with SMTP id d18mr13266189itc.2.1558626537435;
        Thu, 23 May 2019 08:48:57 -0700 (PDT)
Received: from localhost.localdomain ([172.56.12.187])
        by smtp.gmail.com with ESMTPSA id v1sm9124939iob.56.2019.05.23.08.48.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 08:48:56 -0700 (PDT)
From:   Christian Brauner <christian@brauner.io>
To:     viro@zeniv.linux.org.uk, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
        torvalds@linux-foundation.org, fweimer@redhat.com
Cc:     jannh@google.com, oleg@redhat.com, tglx@linutronix.de,
        arnd@arndb.de, shuah@kernel.org, dhowells@redhat.com,
        tkjos@android.com, ldv@altlinux.org, miklos@szeredi.hu,
        linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, linux-arch@vger.kernel.org,
        linux-kselftest@vger.kernel.org, x86@kernel.org,
        Christian Brauner <christian@brauner.io>
Subject: [PATCH v2 0/2] close_range()
Date:   Thu, 23 May 2019 17:47:45 +0200
Message-Id: <20190523154747.15162-1-christian@brauner.io>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hey,

This is v2 of this patchset.

In accordance with some comments There's a cond_resched() added to the
close loop similar to what is done for close_files().
A common helper pick_file() for __close_fd() and __close_range() has
been split out. This allows to only make a cond_resched() call when
filp_close() has been called similar to what is done in close_files().
Maybe that's not worth it. Jann mentioned that cond_resched() looks
rather cheap.
So it maybe that we could simply do:

while (fd <= max_fd) {
       __close(files, fd++);
       cond_resched();
}

I also added a missing test for close_range(fd, fd, 0).

Thanks!
Christian

Christian Brauner (2):
  open: add close_range()
  tests: add close_range() tests

 arch/alpha/kernel/syscalls/syscall.tbl        |   1 +
 arch/arm/tools/syscall.tbl                    |   1 +
 arch/arm64/include/asm/unistd32.h             |   2 +
 arch/ia64/kernel/syscalls/syscall.tbl         |   1 +
 arch/m68k/kernel/syscalls/syscall.tbl         |   1 +
 arch/microblaze/kernel/syscalls/syscall.tbl   |   1 +
 arch/mips/kernel/syscalls/syscall_n32.tbl     |   1 +
 arch/mips/kernel/syscalls/syscall_n64.tbl     |   1 +
 arch/mips/kernel/syscalls/syscall_o32.tbl     |   1 +
 arch/parisc/kernel/syscalls/syscall.tbl       |   1 +
 arch/powerpc/kernel/syscalls/syscall.tbl      |   1 +
 arch/s390/kernel/syscalls/syscall.tbl         |   1 +
 arch/sh/kernel/syscalls/syscall.tbl           |   1 +
 arch/sparc/kernel/syscalls/syscall.tbl        |   1 +
 arch/x86/entry/syscalls/syscall_32.tbl        |   1 +
 arch/x86/entry/syscalls/syscall_64.tbl        |   1 +
 arch/xtensa/kernel/syscalls/syscall.tbl       |   1 +
 fs/file.c                                     |  62 +++++++-
 fs/open.c                                     |  20 +++
 include/linux/fdtable.h                       |   2 +
 include/linux/syscalls.h                      |   2 +
 include/uapi/asm-generic/unistd.h             |   4 +-
 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/core/.gitignore       |   1 +
 tools/testing/selftests/core/Makefile         |   6 +
 .../testing/selftests/core/close_range_test.c | 142 ++++++++++++++++++
 26 files changed, 249 insertions(+), 9 deletions(-)
 create mode 100644 tools/testing/selftests/core/.gitignore
 create mode 100644 tools/testing/selftests/core/Makefile
 create mode 100644 tools/testing/selftests/core/close_range_test.c

-- 
2.21.0

