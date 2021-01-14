Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 517942F6989
	for <lists+linux-mips@lfdr.de>; Thu, 14 Jan 2021 19:32:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727275AbhANSaO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 Jan 2021 13:30:14 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131]:26502 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727171AbhANSaO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 Jan 2021 13:30:14 -0500
Date:   Thu, 14 Jan 2021 18:29:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
        t=1610648971; bh=RzwbjZ6L43WjxULRhCWBHBanGBJIXavoQRGj2bRgtAk=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=bW1YUyUlfo0fjwpqDftr3FMtmu8itVTtKF0nSNH4b9Yz/lphstiQLAAX2msNiWctd
         ykB17dmHAdzj32hO0z1Jljf9bho7z+lZ+MJAiDvPQEokrPrEm9IxZoZeRIrnFF7khe
         /yEanM0fGaKfDdl9NEof/cs0oW5QoC4IhflPys/OL0xk+BrWprOkxHMxtJd88EL37K
         GNpbU0/sCKvDSLWhiA4ujOpYkx0AyczV9ZpGlLVIlBBA/Tlk0naaZDQeUWC7jLD2b8
         ykGmnXpaxpTg3Pw/mVYtRRhZ3niLcl809ifjClT1JagK3TY1mEa/YowtpnFQXGTpa4
         qs270ODtRShmw==
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
From:   Alexander Lobakin <alobakin@pm.me>
Cc:     Alexander Lobakin <alobakin@pm.me>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andrew Morton <akpm@linux-foundation.org>,
        Bibo Mao <maobibo@loongson.cn>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Paul Burton <paulburton@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Guoyun Sun <sunguoyun@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Alexander Lobakin <alobakin@pm.me>
Subject: [PATCH mips-next 0/2] MIPS: fix -Wshadow in include files
Message-ID: <20210114182905.110574-1-alobakin@pm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fix two -Wshadow warnings coming from the include files and thus
repetitive and very annoying when building lots of sources.

Alexander Lobakin (2):
  MIPS: bitops: fix -Wshadow in asm/bitops.h
  MIPS: pgtable: fix -Wshadow in asm/pgtable.h

 arch/mips/include/asm/bitops.h  | 10 +++++-----
 arch/mips/include/asm/pgtable.h | 12 ++++++------
 2 files changed, 11 insertions(+), 11 deletions(-)

--=20
2.30.0


