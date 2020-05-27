Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 983BE1E3836
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2020 07:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725804AbgE0F1t (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 May 2020 01:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbgE0F1s (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 May 2020 01:27:48 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2B18C061A0F;
        Tue, 26 May 2020 22:27:48 -0700 (PDT)
Received: from localhost.localdomain (unknown [142.147.94.151])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 299EA20C80;
        Wed, 27 May 2020 05:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1590557268; bh=PUes/Tk/UxZj54uKU7N3nRt2B+xIx2Jg2fXx2P30x+Q=;
        h=From:To:Cc:Subject:Date:From;
        b=EITQHa722r9e6EvqdSf3orth+DJ+XWcbwoM5DOk9L19hrXOcnh4Dd7sJ+PSEFqdp9
         in0k45TY+mnhMHOd5aQ1CpLIWii1nhIQ5fAHnvsczapiaFPmv7OWic1ybQS5I0ygiI
         FSMjTJweLclmu9et3tGAYahEMoUkp5UKzTgakvHzVaa1gz/GIncqOVJRpv/9Lf7enE
         79ld9AlLYa1P8qxcyJvotL7rwalz8HZwh3rJgPxN0/bxVAh8n59zrlGrbu3f7VJgo/
         lJNF/iXYuJSgS+It9aa194BZ9BdSjseitafTaShowpLTa6GaTcG1jybr34stsv49sN
         ikp+L0ogffsxQ==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Bugy bootloader woraround
Date:   Wed, 27 May 2020 13:27:17 +0800
Message-Id: <20200527052721.366704-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.27.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Jiaxun Yang (2):
  MIPS: head.S: Always jump to kernel_entry at head of text
  MIPS: Loongso64: select NO_EXCEPT_FILL

 arch/mips/Kconfig       | 1 +
 arch/mips/kernel/head.S | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

-- 
2.27.0.rc0

