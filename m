Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 799F53EFD85
	for <lists+linux-mips@lfdr.de>; Wed, 18 Aug 2021 09:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238963AbhHRHMr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 18 Aug 2021 03:12:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239108AbhHRHM0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 18 Aug 2021 03:12:26 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9127DC06179A;
        Wed, 18 Aug 2021 00:11:51 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id x12so1824185wrr.11;
        Wed, 18 Aug 2021 00:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FUltDGbcXfm3L3aKEFjmaGZSqXkkHLKLtJ13isiVEoQ=;
        b=dLfHj03e0E8HEqiG5P2c9osIlABLNIaht2LMk0gC92MgsC5sQkRq2g+g2TzOWFi0UX
         6W7P9P+CW1XG2af32Dbv5QhIBdqFaqjeb1SssG+kj4rwMSe74Dxs8xfmlp6AEKweRioN
         /A6mtcB3u5vVRW8GRRaU95w5uAumtPCo52FL3C7aiE/mGrUXXaty6JLRVDngV0VdFB4I
         kOTlTdthYkCMzB9XecExfdah1/gdV6VFfRrjfsDZ8k31/eMY9CgqZGQaA0775RHZqNRj
         RU1elpQvYamRCbiqkDyOf9bUqKSN6/8q40MfbnPtN+A2jbUSmxzhSCgZd+RZo2uyCYhJ
         vkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FUltDGbcXfm3L3aKEFjmaGZSqXkkHLKLtJ13isiVEoQ=;
        b=ahH0ykYLTTPAhaVQJ9ZLGdLY50P7SUU6QOUSaEYCXttC+RpAhbnnh/ARKQtsr6Hjjk
         QgGo1AByc7CUiBAQSXF5038vNk9VfxBRN4Qt0ObCmqyT+1Woec99gPjeGPqRz81jOfEO
         ca36vO/fyGCORrZHxTnzdCKdqGEaOgCc+8ZucIX10+HoslWhJQHcZl8uq5DJrbj4327t
         X95iDv5fbdnxQrgHc62LyXSomtXmBtyPUgyshuVggSf+/063y7fomN9jhoF9BGxlAFAr
         Fl9nleXWIN/Jdbxpd1+EpdBs/oBjp+YNtG2B3VyrGRbTPvQK3JlLI5WGTn3QdrsqmeNG
         YHNQ==
X-Gm-Message-State: AOAM532cb6vqcfQTvo5JOKxenclLw/uliQYjV93T0/XdpThp1a44bwLg
        Rma2Pdz46K142Q49oUKZTvQ=
X-Google-Smtp-Source: ABdhPJyfWLzgLWSk53JT1d3llQfEeYHOYhA95fVRuSVdzS94w2Pos6wRnvQPxVc9MUuS5mNxbC7VqQ==
X-Received: by 2002:a5d:61c1:: with SMTP id q1mr8658881wrv.87.1629270710074;
        Wed, 18 Aug 2021 00:11:50 -0700 (PDT)
Received: from localhost.localdomain (arl-84-90-178-246.netvisao.pt. [84.90.178.246])
        by smtp.gmail.com with ESMTPSA id r10sm4925729wrp.28.2021.08.18.00.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 00:11:49 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-usb@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Michael Ellerman <mpe@ellerman.id.au>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH 3/3] usb: remove reference to deleted config STB03xxx
Date:   Wed, 18 Aug 2021 09:11:37 +0200
Message-Id: <20210818071137.22711-4-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210818071137.22711-1-lukas.bulwahn@gmail.com>
References: <20210818071137.22711-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit 7583b63c343c ("powerpc/40x: Remove STB03xxx") removes the config
STB03xxx, but left a reference in ./drivers/usb/Kconfig behind.

Hence, ./scripts/checkkconfigsymbols.py warns:

STB03xxx
Referencing files: drivers/usb/Kconfig

Remove this reference to the deleted config.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 drivers/usb/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/Kconfig b/drivers/usb/Kconfig
index 26475b409b53..578a439e71b5 100644
--- a/drivers/usb/Kconfig
+++ b/drivers/usb/Kconfig
@@ -11,7 +11,7 @@ config USB_OHCI_BIG_ENDIAN_MMIO
 
 config USB_OHCI_LITTLE_ENDIAN
 	bool
-	default n if STB03xxx || PPC_MPC52xx
+	default n if PPC_MPC52xx
 	default y
 
 config USB_EHCI_BIG_ENDIAN_MMIO
-- 
2.26.2

