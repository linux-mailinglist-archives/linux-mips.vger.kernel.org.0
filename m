Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 920F813352
	for <lists+linux-mips@lfdr.de>; Fri,  3 May 2019 19:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728010AbfECRv2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 3 May 2019 13:51:28 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41688 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726468AbfECRv2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 3 May 2019 13:51:28 -0400
Received: by mail-lf1-f67.google.com with SMTP id d8so4977684lfb.8;
        Fri, 03 May 2019 10:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5Xc1lqPauDIMFD0MNs8y4CED4Y5I1IvQmZCShIC6+vg=;
        b=tOOk4CJEzqsHAYS1GBsQ9bxO9PSAJ21SbOAhwY6MFE35Fvp1w8mxmqS1EpT1QzXsH2
         FEBO1WWd24MsC4phRG0M5wKRlfTXD8i6IxzK9FGlOL3ZQZnHw1eQyh9li9ydvrKctViQ
         44dWV+G9I99wyMrwNztAyJJhNM0XILqnUOgxM4uiq0Vdm+k6O/duseAJ5hK0e7dax/P2
         YGSkdI2U0nXf7G7GX8q+Ivtcp2wL/Gw4kn1DRP+AuPdnrnF9Dp9c797XTRNSHoGoCJJR
         M/NRtm34SICHsbqCCWAGU3xE1vvuaIPLsEZR3MR7O+moAuNsQMPHI8gdepnMtn6kF8fu
         Ey7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5Xc1lqPauDIMFD0MNs8y4CED4Y5I1IvQmZCShIC6+vg=;
        b=MF3LqDlgJwwwqwDVI8mH/Q6lA/VG9arGzYnA1waxqzlFuEmuSDjaDaka2MT92y9ZPM
         qR6Zopqub6LQZND2DaTv0mecmTutL/BIero6DuhYhZSa41Gk94Dec0ijuwYqh/gaQcaI
         JUhh8U6h0t46wM3wW6zTRenA+h2Zk2J8LfhauCFKI6c7qjAtGvlpsDc6D+N9wxm30t4+
         AZVq+g0N3IlJ3tEKacMMKyf7OJPj4jiq+Q13VUdM52kupcDCY+iKiZ8AXXSD/vHUige9
         XVxDcPbSBDA9K/GIssPA1AWaidxDvZNVW9Wz2q2qbbRBpXIubQl7kpdNdW0OJEgL5EN7
         Rgtg==
X-Gm-Message-State: APjAAAWMZhSzN55tQgwdBm8UKViudor/hQX9jkbuVXZRA+Hiypc80mXL
        5h7WcCVeqJfozBarW5uPj1c=
X-Google-Smtp-Source: APXvYqwTEFuECUK/vfFD44jwHjjLqYMcsk+LwbhDKZ2KmRXaRkh1HK+pQY1gFbaFfTv34x4GE1XWrg==
X-Received: by 2002:a19:9f01:: with SMTP id i1mr5632630lfe.98.1556905885055;
        Fri, 03 May 2019 10:51:25 -0700 (PDT)
Received: from localhost.localdomain ([5.164.217.122])
        by smtp.gmail.com with ESMTPSA id z30sm533435lfb.87.2019.05.03.10.51.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 May 2019 10:51:24 -0700 (PDT)
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Huacai Chen <chenhc@lemote.com>,
        Stefan Agner <stefan@agner.ch>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Juergen Gross <jgross@suse.com>
Cc:     Serge Semin <Sergey.Semin@t-platforms.ru>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] mips: Post-bootmem-memblock transition fixes
Date:   Fri,  3 May 2019 20:50:36 +0300
Message-Id: <20190503175041.7949-1-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: 20190423224748.3765-1-fancer.lancer@gmail.com
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

First attempt of making the MIPS subsystem utilizing the memblock early memory
allocator was done by me a few years ago. I created a patchset with
21 patches [1]. It turned out to be too complicated and I decided to resend a
reworked patchset with smaller number of changes [2]. I did this and after a
small review process a v2 patchset was also posted. Then my spare
time was over and I couldn't proceed with the patchset support and
resubmission.

In a year Mike Rapoport took charge in this task and posted a small
patch which essentially did the bootmem allocator removal from MIPS
subsystem [3]. A single small patch did in general the whole thing my huge
patchsetes were intended for in the first place (though it lacked a few fixes).
Mike even went further and completely removed the bootmem allocator from
kernel code, so all the subsystems would need to use the only one early
memory allocator. This significantly simplified the platforms code as well
as removed a deprecated subsystem with duplicated functionality. Million
credits to Mike for this.

Getting back to the MIPS subsystem and it memblock allocator usage. Even
though the patch suggested by Mike [3] fixed most of the problems caused
by enabling the memblock allocator usage, some of them have been left
uncovered by it. First of all the PFNs calculation algorithm hasn't been
fully refactored. A reserved memory declaration loop has been left
untouched though it was clearly over-complicated for the new initialization
procedure. Secondly the MIPS platform code reserved the whole space below
kernel start address, which doesn't seem right since kernel can be
located much higher than memory space really starts. Thirdly CMA if it
is enabled reserves memory regions by means of memblock in the first place.
So the bootmem-init code doesn't need to do it again. Fifthly at early
platform initialization stage non of bootmem-left methods can be called
since there is no memory pages mapping at that moment, so __nosave* region
must be reserved by means of memblock allocator. Finally aside from memblock
allocator introduction my early patchsets included a series of useful
alterations like "nomap" property implementation for "reserved-memory"
dts-nodes, memblock_dump_all() method call after early memory allocator
initialization for debugging, low-memory test procedure, kernel memory
mapping printout at boot-time, and so on. So all of these fixes and
alterations are introduced in this new patchset. Please review. Hope
this time I'll be more responsive and finish this series up until it
is merged.

[1] https://lkml.org/lkml/2016/12/18/195
[2] https://lkml.org/lkml/2018/1/17/1201
[3] https://lkml.org/lkml/2018/9/10/302

NOTE I added a few "Reviewed-by:  Matt Redfearn <matt.redfearn@mips.com>"
since some patches of this series have been picked up from my earlier
patchsets, which Matt's already reviewed. I didn't add the tag for patches,
which were either new or partially ported.

Changelog v2
- Discard forcible selection of OF_RESERVED_MEM config
- Reword 'mips: Dump memblock regions for debugging' commit message since
  memblock debug printout is activated by memblock=debug kernel parameter
- Rebase onto mips-next
- Keep patches from 8 to 12 as the rest of them have already been merged


Serge Semin (5):
  mips: Dump memblock regions for debugging
  mips: Perform early low memory test
  mips: Print the kernel virtual mem layout on debugging
  mips: Make sure dt memory regions are valid
  mips: Manually call fdt_init_reserved_mem() method

 arch/mips/kernel/prom.c  | 14 +++++++++++-
 arch/mips/kernel/setup.c |  7 ++++++
 arch/mips/mm/init.c      | 49 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 69 insertions(+), 1 deletion(-)

-- 
2.21.0

