Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CD00535F0B
	for <lists+linux-mips@lfdr.de>; Fri, 27 May 2022 13:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239554AbiE0LN3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 27 May 2022 07:13:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232837AbiE0LN0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 27 May 2022 07:13:26 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 128855B3CE
        for <linux-mips@vger.kernel.org>; Fri, 27 May 2022 04:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1653649999; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yg1zkLQ48m1bUPb4IC8LaZ7CEozCLqr6XShxmBPpr4k=;
        b=EU+7b5B+0NqYQ4lj+tpwsMkm4ryHUH1uEZqUA8r7dJMY03IzxbKDD+ool2zRM80N5JrwqX
        ZvKbd8jRwliyBV2dM/4IascnTFgNCFAopdqc4BWvZsa8CEGV2XNGqiNLYxV0vXRfWriT0c
        34Bv1c+wSlg33cfUrXbApMx8iOLAVCM=
Date:   Fri, 27 May 2022 12:13:07 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: Ingenic X SoC cache problems
To:     Yunian Yang <reimu@sudomaker.com>
Cc:     linux-mips@vger.kernel.org, zhouyanjie@wanyeetech.com
Message-Id: <VHGJCR.M60L1GIL1X4U1@crapouillou.net>
In-Reply-To: <c102518f-3288-29fb-6653-0d39a53639df@sudomaker.com>
References: <c102518f-3288-29fb-6653-0d39a53639df@sudomaker.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

What kernel version are you using?

Do you have the commit 1660710cf5d8 ("MIPS: mm: XBurst CPU requires=20
sync after DMA")?

Cheers,
-Paul


Le ven., mai 27 2022 at 19:03:56 +0800, Yunian Yang=20
<reimu@sudomaker.com> a =E9crit :
> Hello all.
>=20
> In the past month, I was struggling with random memory corruptions=20
> and crashes on the Ingenic X1000. After some detailed testing, I need=20
> to point out, the current cache management routines seems to be=20
> incorrect for X1000, and maybe all X series SoCs. It mainly affects=20
> DMA operations. Every form of peripheral to RAM transfer will corrupt=20
> the RAM, and this includes the dwc2 and SFC's DMA and the PDMA=20
> controller. If all the DMAs are disabled (e.g. hard coding=20
> dma_capable =3D false in dwc2), it will be fine running CPU and I/O=20
> benchmarks for a week. If you have the hardware, you can enable the=20
> kernel data structures & memory debugging and see for yourself.
>=20
> So I went back and looked at Ingenic's old 4.4 and 3.10 kernel=20
> sources. They used a separate file (sc-xburst.c) for the cache=20
> routines, which is based on an very old sc-mips.c. And there are two=20
> important macros, called MIPS_CACHE_SYNC_WAR and=20
> MIPS_BRIDGE_SYNC_WAR. They're both set to 1. However these macros are=20
> removed from the kernel long time ago. The line=20
> `mips_sc_ops.bc_wback_inv =3D mips_bridge_sync_war;' seems to be the=20
> key point.
>=20
> Do you have any recommendations of what could be done to fix this=20
> problem?
>=20
> Thanks and best regards!


