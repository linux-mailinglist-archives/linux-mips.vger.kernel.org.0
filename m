Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A55D777C128
	for <lists+linux-mips@lfdr.de>; Mon, 14 Aug 2023 22:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232294AbjHNT7g (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Aug 2023 15:59:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232395AbjHNT7d (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 14 Aug 2023 15:59:33 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A545D10E5
        for <linux-mips@vger.kernel.org>; Mon, 14 Aug 2023 12:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=aTF19kglWG/MU4R+nI9l6Vm0zHIQgtzfTiybOjPngaE=; b=qX0SeuccG/D1b4Tx7WNBsNwNie
        4mXhESWAypVhEeQvuNVb2OWrKj1sshxHMgAmpvEy2PBiL4sKp4ATNFtQmI2e4j8JunqdeLVEwa1GA
        SHzbnvTYcm2Zd13hW5mz8+RCfP9Xa5EnZe1+ffsSjGLOrt9D4nmjNNc+MvO3TcUX0/2jbUBFwrIUI
        aB6vu7HJwBPRIkiXj56Ld+kZXvAuO6DZ6y508szBxqvmPKhLWwIZS1cnFxupjFUGX15yntiNFHO+E
        7jHNVuoEfpmqmESHTQi6kry3yxaR2gienImI4No5B67WCaWutg2U0OlUzBCOLOqvF8B7ma0QzNIjk
        lKfzAV9A==;
Received: from [2601:1c2:980:9ec0::2764]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qVdir-000G0L-0m;
        Mon, 14 Aug 2023 19:59:29 +0000
Message-ID: <3484e4ea-1743-8d66-0e7b-4f1576e3a32e@infradead.org>
Date:   Mon, 14 Aug 2023 12:59:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>,
        linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: build error with DECSTATION and FB_MAXINE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

When
# CONFIG_32BIT is not set
CONFIG_64BIT=y
CONFIG_MACH_DECSTATION=y
# CONFIG_CPU_R3000 is not set
CONFIG_CPU_R4X00=y
CONFIG_FB_MAXINE=y

the build fails due to the use of the KSEG1ADDR() macro, which is only
defined for 32BIT:

In file included from ../drivers/video/fbdev/maxinefb.c:34:
../drivers/video/fbdev/maxinefb.c: In function 'maxinefb_ims332_write_register':
../include/video/maxinefb.h:16:41: error: implicit declaration of function 'KSEG1ADDR'; did you mean 'CKSEG1ADDR'? [-Werror=implicit-function-declaration]
   16 | #define MAXINEFB_IMS332_ADDRESS         KSEG1ADDR(0x1c140000)
      |                                         ^~~~~~~~~
../drivers/video/fbdev/maxinefb.c:66:49: note: in expansion of macro 'MAXINEFB_IMS332_ADDRESS'
   66 |         register unsigned char *regs = (char *) MAXINEFB_IMS332_ADDRESS;
      |                                                 ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/video/fbdev/maxinefb.c:66:40: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
   66 |         register unsigned char *regs = (char *) MAXINEFB_IMS332_ADDRESS;
      |                                        ^
../drivers/video/fbdev/maxinefb.c: In function 'maxinefb_ims332_read_register':
../drivers/video/fbdev/maxinefb.c:76:40: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
   76 |         register unsigned char *regs = (char *) MAXINEFB_IMS332_ADDRESS;
      |    


Any suggestions or patches for this?
thanks.

-- 
~Randy
