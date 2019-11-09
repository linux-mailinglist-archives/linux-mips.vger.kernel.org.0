Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66996F6129
	for <lists+linux-mips@lfdr.de>; Sat,  9 Nov 2019 20:18:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbfKITSG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 9 Nov 2019 14:18:06 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35234 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbfKITRu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 9 Nov 2019 14:17:50 -0500
Received: by mail-pf1-f196.google.com with SMTP id d13so7412691pfq.2
        for <linux-mips@vger.kernel.org>; Sat, 09 Nov 2019 11:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IkFL+O4AgYFx1OONXesexHJ5CbtF3Jn1N0Qya4xrddw=;
        b=YPrLHNngmS1tJAvcSMsgJEZh8HdBQEwSw0bJ8S5ojIqaCdtTh7y7x/8xvEXf2Z00n6
         p++6Y/urc8Z88qhr3eCTXqqZmdpWySEgIEww+jNkXaRb+J2epcucNuHiJuFiHlxW0uKk
         AHYlELgxTqUl9pjpfsdumyOeWgfzdZSuHm8vk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IkFL+O4AgYFx1OONXesexHJ5CbtF3Jn1N0Qya4xrddw=;
        b=c3HtLu9Goxq/z/HOPYEunPDUkS62PUWnA/+axQ0FpxKQDcRxTxfnYSFuGC/GrECSpN
         y3m3VeRl46BNfiiug00n5XNDWK7bO0yjpMJP6ckeT4CCFgOR4ewI3Zs1EhVd6hIORqOV
         ukZp1+79f8L/ujl/JDHNVGSObLGds2q7SFo87prVO59eozEgLlhPj4Es/P9sK0/i7n/Z
         BbzaQ/NznPeMD5EouInl+HSBUdhVQ4+DVCYb8EO9bx1VZ3RABSY/MToIvnHz7Y6st4zy
         vL3FHwp1R2Zp8tObXcbT3EC01oep2zbttvjdY5GvWrlCdSapoh3FPTGHwsc1BP/1HOYp
         ZZZg==
X-Gm-Message-State: APjAAAVy6ZMW8W2DdlRr9p+k4HMFp0B1ziKOHRHFeYVidq5xQSQBnI93
        BJSQlmcsYF/5/HE0pqCGLNYeCwhctJE=
X-Google-Smtp-Source: APXvYqyTQDUg289HvMjCfRmb7zKuKPtAOHS7ULkRiIVT4D+AHpNRRfK1XQJS7vZzBBWOsf2O8cIF9A==
X-Received: by 2002:a62:1c8:: with SMTP id 191mr20604153pfb.152.1573327068017;
        Sat, 09 Nov 2019 11:17:48 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id i11sm9193577pgd.7.2019.11.09.11.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2019 11:17:47 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Paul Burton <paul.burton@mips.com>,
        Jason Wessel <jason.wessel@windriver.com>,
        Daniel Thompson <daniel.thompson@linaro.org>
Cc:     qiaochong@loongson.cn, kgdb-bugreport@lists.sourceforge.net,
        ralf@linux-mips.org, Douglas Anderson <dianders@chromium.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Chuhong Yuan <hslester96@gmail.com>,
        linux-mips@vger.kernel.org, Nicholas Mc Guire <hofrat@osadl.org>,
        James Hogan <jhogan@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Prarit Bhargava <prarit@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Will Deacon <will@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        linux-kernel@vger.kernel.org,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 0/5] kdb: Don't implicitly change tasks; plus misc fixups
Date:   Sat,  9 Nov 2019 11:16:39 -0800
Message-Id: <20191109191644.191766-1-dianders@chromium.org>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This started out as just a follow-up to Daniel's post [1].  I wanted
to stop implicitly changing the current task in kdb.  ...but, of
course, everywhere you look in kdb there are things to cleanup, so
this gets a few misc cleanups I found along the way.  Enjoy.

[1] https://lore.kernel.org/r/20191010150735.dhrj3pbjgmjrdpwr@holly.lan


Douglas Anderson (5):
  MIPS: kdb: Remove old workaround for backtracing on other CPUs
  kdb: kdb_current_regs should be private
  kdb: kdb_current_task shouldn't be exported
  kdb: Gid rid of implicit setting of the current task / regs
  kdb: Get rid of confusing diag msg from "rd" if current task has no
    regs

 arch/mips/kernel/traps.c       |  5 -----
 include/linux/kdb.h            |  2 --
 kernel/debug/kdb/kdb_bt.c      |  8 +-------
 kernel/debug/kdb/kdb_main.c    | 31 ++++++++++++++-----------------
 kernel/debug/kdb/kdb_private.h |  2 +-
 5 files changed, 16 insertions(+), 32 deletions(-)

-- 
2.24.0.432.g9d3f5f5b63-goog

