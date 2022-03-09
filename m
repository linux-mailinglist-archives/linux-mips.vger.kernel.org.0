Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 832374D3941
	for <lists+linux-mips@lfdr.de>; Wed,  9 Mar 2022 19:52:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236933AbiCISvg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Mar 2022 13:51:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234205AbiCISvf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 9 Mar 2022 13:51:35 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA8C4186472
        for <linux-mips@vger.kernel.org>; Wed,  9 Mar 2022 10:50:36 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id s8so3055275pfk.12
        for <linux-mips@vger.kernel.org>; Wed, 09 Mar 2022 10:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LmBWuji62xMcbSxN3hasm53uq/foQCgG4A7RDdCuhEA=;
        b=YsD0B8nTyZZLwlk4V33mqLFeE/khuGQj8poFYl9QAQZUtZVqnEMe2uAQxrQmJGFkru
         kXTYhMEvKJTdaaYLt3tWsHRa4EI+Ek8BkwvP+bXVztKQq+FZ+NSyBdhzBRL80Z57X/oX
         C4SsPdHzlzc3GsQlWOQ2zBBQDPPxUzNM/JYMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LmBWuji62xMcbSxN3hasm53uq/foQCgG4A7RDdCuhEA=;
        b=5++hxxuvemAqHicdCfOCNiFXrLUhiQgZvru8ZTLO8KaUvBE8ga1BObkD4DjGjoqAGW
         dz2m3iia00JW3y8x8cj+mhO6I1KzviZC+DKaV2t8uaWb5RpVpDCD3/pe1k+00mGe473H
         rJK9ecgMsEsfl1kJjKU7g9TsZwvSRsBUpj7VWAuyAHUWRLe6Tiqv4sSycU3Buu4ZlM+b
         AOnZnmfIZZzusZBxnz5Y58yZs0/NWsVIDPD6fpNnywXI65dosG/V6PrFyw/LPHZPh3Gg
         ts7WxqBH1VCe3E1JNq4A7XpuEOM+f9hMyXyO/of79WB5nXgVaLKep8VF4lA+nE7rj7im
         dWvg==
X-Gm-Message-State: AOAM530KLyGxPym8M0g6bLNxRiDm1R35obiXhEiEppapVIk5BShS5ukW
        DKINCrJH9eH+0QXxr/yckThhIQ==
X-Google-Smtp-Source: ABdhPJzSLLywDntydW15xHyRFHbQQ/clWq4yqveU2NycAIWeDgwg6HfptJrYQstXlq2+fj1nCGYOtg==
X-Received: by 2002:a63:1d59:0:b0:380:6a04:89da with SMTP id d25-20020a631d59000000b003806a0489damr902517pgm.9.1646851836164;
        Wed, 09 Mar 2022 10:50:36 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d11-20020a056a0024cb00b004f725ecf900sm4036390pfv.97.2022.03.09.10.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 10:50:35 -0800 (PST)
From:   Kees Cook <keescook@chromium.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Kees Cook <keescook@chromium.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-mips@vger.kernel.org, kernel test robot <lkp@intel.com>,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: [PATCH] MIPS: boot/compressed: Use array reference for image bounds
Date:   Wed,  9 Mar 2022 10:50:32 -0800
Message-Id: <20220309185032.229123-1-keescook@chromium.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3189; h=from:subject; bh=VIo9E2qUGoV4Cmo8f/F9aHEfX2uAnletay6wwUkPAXw=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBiKPb42VibsKsjr0HXyMgOKJMCkA5Yp13b4Yzgcert 6dHWVb2JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYij2+AAKCRCJcvTf3G3AJjucD/ 4wbt2yweQM/CJfDQiloQJAp0O67CUFaRU7T/QetWWZOkK3PBz1KjwhPzIbH0WD45wZ/Z7aQ0wfTula x/qo/69aDSWW/vtctucH2OqHWA4UYFtMDpki8D8g2TZAqtD4attVM+fdbXpgYe0XFy2zHK0Xo9l9P+ TXnCeg3l7qpFNAVTmzdrvtjvO1b3UONop1yzkxTI+8Mo4SOTGmW3de9T0md6/J8dCcDHOF0RO5hN03 qZxwDBNy+7pYZ4FZBll2NvvqdtCAlmkbleofmr9h2qXYEe2VC2N3UEkw9zwdp4K/KKfNndlohmvKJO qNqxrRaidm0IVl0grG9m1TR7G+Cr12WfwetlEbS8VdCH//i3GV2USpAwofAsFPfgK4gd7855Bk3Xjb vcxzcx680unG6ftaeLJms963OzWa+7DxPStxhXPd38fBqdUom9mMSBJyxdJozJX3uEQ6LuIOpYmVO+ Wln6e7HdJ84FkmxwuxXkv1xF19MQ9YFluagcFJARWIc4R+NPrEBszpkUtfD0JVPC6VUgE8+Hq/jQb+ 7AEuo8tWN0bPZYobufB071WlhDf4cv8ZNiPGNNGgLl/ASoFHuo31ynolImmpQSDQqZy9DDyIjFU7PE dE2JJDb7nbrrwensGvPGjQUZ8uQAl+RpSA/snCYJEahjT1SapwM3EgLPV+7A==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

As done with other image addresses in other architectures, use an
explicit flexible array instead of "address of char", which can trip
bounds checking done by the compiler. Found when building with
-Warray-bounds:

In file included from ./include/linux/byteorder/little_endian.h:5,
                 from ./arch/mips/include/uapi/asm/byteorder.h:15,
                 from ./arch/mips/include/asm/bitops.h:21,
                 from ./include/linux/bitops.h:33,
                 from ./include/linux/kernel.h:22,
                 from arch/mips/boot/compressed/decompress.c:13:
arch/mips/boot/compressed/decompress.c: In function 'decompress_kernel':
./include/asm-generic/unaligned.h:14:8: warning: array subscript -1 is outside array bounds of 'unsigned char[1]' [-Warray-bounds]
   14 |  __pptr->x;        \
      |  ~~~~~~^~~
./include/uapi/linux/byteorder/little_endian.h:35:51: note: in definition of macro '__le32_to_cpu'
   35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
      |                                                   ^
./include/asm-generic/unaligned.h:32:21: note: in expansion of macro '__get_unaligned_t'
   32 |  return le32_to_cpu(__get_unaligned_t(__le32, p));
      |                     ^~~~~~~~~~~~~~~~~
arch/mips/boot/compressed/decompress.c:29:37: note: while referencing '__image_end'
   29 | extern unsigned char __image_begin, __image_end;
      |                                     ^~~~~~~~~~~

Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-mips@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/mips/boot/compressed/decompress.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/mips/boot/compressed/decompress.c b/arch/mips/boot/compressed/decompress.c
index aae1346a509a..5b38a802e101 100644
--- a/arch/mips/boot/compressed/decompress.c
+++ b/arch/mips/boot/compressed/decompress.c
@@ -26,7 +26,7 @@ unsigned long free_mem_ptr;
 unsigned long free_mem_end_ptr;
 
 /* The linker tells us where the image is. */
-extern unsigned char __image_begin, __image_end;
+extern unsigned char __image_begin[], __image_end[];
 
 /* debug interfaces  */
 #ifdef CONFIG_DEBUG_ZBOOT
@@ -91,9 +91,9 @@ void decompress_kernel(unsigned long boot_heap_start)
 {
 	unsigned long zimage_start, zimage_size;
 
-	zimage_start = (unsigned long)(&__image_begin);
-	zimage_size = (unsigned long)(&__image_end) -
-	    (unsigned long)(&__image_begin);
+	zimage_start = (unsigned long)(__image_begin);
+	zimage_size = (unsigned long)(__image_end) -
+	    (unsigned long)(__image_begin);
 
 	puts("zimage at:     ");
 	puthex(zimage_start);
@@ -121,7 +121,7 @@ void decompress_kernel(unsigned long boot_heap_start)
 		dtb_size = fdt_totalsize((void *)&__appended_dtb);
 
 		/* last four bytes is always image size in little endian */
-		image_size = get_unaligned_le32((void *)&__image_end - 4);
+		image_size = get_unaligned_le32((void *)__image_end - 4);
 
 		/* The device tree's address must be properly aligned  */
 		image_size = ALIGN(image_size, STRUCT_ALIGNMENT);
-- 
2.32.0

