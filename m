Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2D7034D01E
	for <lists+linux-mips@lfdr.de>; Mon, 29 Mar 2021 14:33:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230358AbhC2Mct (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Mar 2021 08:32:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230526AbhC2McZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 29 Mar 2021 08:32:25 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 901FBC061574
        for <linux-mips@vger.kernel.org>; Mon, 29 Mar 2021 05:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=g8Xxl3VkACp1/s0i7ysFwqAfxLiDM5o6HAGYwiBVYf8=; b=qn4QWaaJfDgdOdpQPiK3cd9Tg/
        YMwup0Zc2Bm1tOXbzY5tt1fYhhoPScLrk7aR6HcWLVz6qyDlyl2C1OsDUGZc7pQta+DFL+e97+8J5
        Qo90FBOeM5BR6tZePnUQrEDSf3beSy/MPR5GnXDVeutXO3z6X5QQWC3kbaUhOfsjxXx96RffMm97K
        8GdW6xdix6cLPyaekCvV16NU5r2fTyulP3VyP2tU4qfRliTf/YsW711bRLH7yfcdsD/Yu09NyJDwF
        s1u6hAscTAR+U8Robn1B1zBZzQ/1A1D/2zcQ5a7y3G0i1J4l9qglNK5xsP9gIf/yVB5/SRTU3K2Xm
        c3VEuj/Q==;
Received: from 97-173-191-90.dyn.estpak.ee ([90.191.173.97] helo=ubuntu)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <sandberg@mailfence.com>)
        id 1lQr46-0008Uc-KO; Mon, 29 Mar 2021 15:32:19 +0300
Received: by ubuntu (sSMTP sendmail emulation); Mon, 29 Mar 2021 15:32:13 +0300
From:   Mauri Sandberg <sandberg@mailfence.com>
To:     sandberg@mailfence.com
Cc:     f.fainelli@gmail.com, linux-mips@vger.kernel.org,
        tsbogend@alpha.franken.de
Subject: [PATCH v3 0/1] MIPS: fix compilation error
Date:   Mon, 29 Mar 2021 15:31:35 +0300
Message-Id: <20210329123136.3717-1-sandberg@mailfence.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326134158.268164-1-sandberg@mailfence.com>
References: <20210326134158.268164-1-sandberg@mailfence.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 90.191.173.97
X-SA-Exim-Mail-From: sandberg@mailfence.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Cleaned up the commit message and added reviewed-by, tested-by and Cc: tags.

Cheers,
Mauri

--

Notes
 v2:
  - errorneous proposal to revert whole commit. withdrawn.
 v3:
  - as v1.
  - Added Reviewed-by: and Tested-By for Thomas Bogendoerfer
  - reworded commit message
  - added Cc: trivial@kernel.org

rangediff v1...v3
1:  cff3565c8f48 ! 1:  e4e83543be07 MIPS: kernel: setup.c: fix compilation error
    @@ Metadata
      ## Commit message ##
         MIPS: kernel: setup.c: fix compilation error
     
    -    Developing against mips/mips-next I get a compilation error.
    -    With the attached patch compilation succeeds.
    +    With ath79_defconfig enabling CONFIG_MIPS_ELF_APPENDED_DTB gives a
    +    compilation error. This patch fixes it.
     
         Build log:
         ...
    @@ Commit message
           CC      fs/attr.o
         make[4]: *** [../scripts/Makefile.build:271: arch/mips/kernel/setup.o]
          Error 1
    -    make[3]: *** [../scripts/Makefile.build:514: arch/mips/kernel] Error 2
    -    make[2]: *** [/home/ubuntu/git/linux/Makefile:1849: arch/mips] Error 2
    -    make[2]: *** Waiting for unfinished jobs....
         ...
     
         Root cause seems to be:
    -    commit b83ba0b9df56 ("MIPS: of: Introduce helper function to get DTB")
    +    Fixes: b83ba0b9df56 ("MIPS: of: Introduce helper function to get DTB")
     
         Signed-off-by: Mauri Sandberg <sandberg@mailfence.com>
    +    Reviewed-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
    +    Tested-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
    +    Cc: trivial@kernel.org
     
      ## arch/mips/kernel/setup.c ##
     @@

Mauri Sandberg (1):
  MIPS: kernel: setup.c: fix compilation error

 arch/mips/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


base-commit: 19f0e8cddf0f136112acaaf02dab2cee35b56439
-- 
2.25.1

