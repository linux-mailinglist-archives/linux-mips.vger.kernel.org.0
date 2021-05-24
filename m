Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2C0E38E10F
	for <lists+linux-mips@lfdr.de>; Mon, 24 May 2021 08:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232291AbhEXGiT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 May 2021 02:38:19 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:41547 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232279AbhEXGiS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 May 2021 02:38:18 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id EEC2F176B;
        Mon, 24 May 2021 02:36:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 24 May 2021 02:36:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=0
        gLp0u1k6AuN8zl86qMOh8fyOL21dVeUTTxNZuSdIFE=; b=nrPgbk/RKGHhigKl8
        AQ9P86Vs7OLzWzLxklN3uWJvNrP9y+nFxyyrc+IEovCCVE19iqbmiwudVtSMegQp
        5GGRspcz4ooUpjBEwTV/TpI6KpJMZotYf3z5wKu3QYY53IM4DC+zN29riscTuGhO
        Pr/hEMXWM2v5wsIzrRKM0SCj7YhwRrp3nhlC0wL4PB2EuPbCrNab+vqveCsBas1K
        wfqFRpAe6D/CvyVFgSIXt4VZM06bIo5qMoszM868Gaqw6koyciiZIquRwXtexGIu
        r/7VWwwwcrgTp6FCwn2of2TEP3TogS73lKk5uztTLD27lyFRkoAE3S5DBTFSzUc3
        nqBzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=0gLp0u1k6AuN8zl86qMOh8fyOL21dVeUTTxNZuSdI
        FE=; b=grbodlkHwPi7/lzv4lM4zcKPKmL+ZE2rLzLBnqTV0HWmDdmwiBryXyIRa
        2KPsz9jcrovd3ULLNFwK/EilX2QTNzlbiVEHC1B5xUcEQfYYOjTYZXWZJanS9oDD
        ETtTOyTuSdZJ6wIqkxzp0mhx3ZP80tWBUhMJeNHnVFjYUgRGPoBc8voL8Qpd5RJT
        XvwK2a/drWjDNzUNwdrMqj4IFEfF/VSUCot0OObZaJR9FiAFVTSrfsce1g06T8ce
        ya+MO0roh+ycbw//JUwBKwQYYZKEaCXZNvW2qTCuaclflQsonM+6bcgqdryW3xb+
        ZW6glAk2bWGS9VzxDn0+kZ1fbjI7g==
X-ME-Sender: <xms:gEmrYFNoxaCJwfGiv_vAl2tO0KUPeYAgtAAzcB9Hr6ERAuIozdRnhQ>
    <xme:gEmrYH8ZQj7DKl7Si3xJkfukcB_DNu5cc0LgZ-_F8kO2j83fpXivAqUqlzUoEshXA
    WqVssLJ5ksYrpxHMa0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejkedgkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgsehtke
    ertddtfeftnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludeitddvkeffge
    fgueekjeegfeefteelgffhkeffueetieejgeehhfeuffdvnecukfhppedutddurdekvddr
    heejrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:gEmrYERNgX9SWkaFkYCKiAgPSaJoH-OsrALtHYRg2ro9DsfqUTfPqw>
    <xmx:gEmrYBtqDO0EjD-q01vcvhVXB_6xnQBoihSg04zBoUXWAvwrq4rvew>
    <xmx:gEmrYNczxYx12KChvX1HzKwpkPiDxgpZxFSskNQ6q9FdXMqsVDgIAQ>
    <xmx:gUmrYGGwFY3zHLKlVH3xLp_-dkvqXTYozVpX-YOuua0XRbiX4AyWyQ>
Received: from [192.168.140.245] (unknown [101.82.57.64])
        by mail.messagingengine.com (Postfix) with ESMTPA;
        Mon, 24 May 2021 02:36:44 -0400 (EDT)
Subject: Re: [PATCH 0/5] mips: dts: loongson: fix DTC unit name warnings
To:     zhaoxiao <zhaoxiao@uniontech.com>, robh+dt@kernel.org,
        tsbogend@alpha.franken.de
Cc:     maoxiaochuan@loongson.cn, zhangqing@loongson.cn,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1621586643.git.zhaoxiao@uniontech.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <7039a1bb-2788-631d-076f-71284454601b@flygoat.com>
Date:   Mon, 24 May 2021 14:36:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <cover.1621586643.git.zhaoxiao@uniontech.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2021/5/24 14:07, zhaoxiao Ð´µÀ:
> *** BLURB HERE ***
Hi Xiao,

Most of these are not real problem beside patch 2.

There are some established by usage rules important than these
verbose warnings.

Thanks.

- Jiaxun

>
> zhaoxiao (5):
>    mips: dts: loongson: fix DTC unit name warnings
>    mips: dts: loongson: fix DTC unit name warnings
>    mips: dts: loongson: fix DTC unit name warnings
>    mips: dts: loongson: fix DTC unit name warnings
>    mips: dts: loongson: fix DTC unit name warnings
>
>   arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi       | 2 +-
>   arch/mips/boot/dts/loongson/loongson64g-package.dtsi     | 4 ++--
>   arch/mips/boot/dts/loongson/loongson64v_4core_virtio.dts | 2 +-
>   arch/mips/boot/dts/loongson/ls7a-pch.dtsi                | 2 +-
>   arch/mips/boot/dts/loongson/rs780e-pch.dtsi              | 2 +-
>   5 files changed, 6 insertions(+), 6 deletions(-)
>

