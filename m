Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B17D11D438E
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2020 04:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbgEOCdw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 22:33:52 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17762 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726176AbgEOCdv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 14 May 2020 22:33:51 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1589510015; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=XrNbjK2JzDL+oW9cOJ6TVXSX1BBA6clxLNBleupsCQY0k/jX+LQ77zeaNvBg/9jGpsjqqCCLO8sKBd5m49S0BvNVy07RF2TYzT6JEmMTH3jHTFL0+Ja/AEqgQKlecRFlM+wwTSqEKjaXKDvjKiLjslT3lGQcEcCuh2g9m7RHNuM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1589510015; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:References:Subject:To; 
        bh=0dz0tsk8IyniG3Mpw42gBiYzPUtONnY4I4J1LK/ahDI=; 
        b=OyBPeGMLzZZ39SVoWCwgN+SI/SapdSwRJl6T5cDhInbUOg5EhNOrnenqxO+ueciQMNengPPOLokA3GT6t9oeXsFu3133/w8vehM9Txq/ckls797hFu8q/LtsLHuHV1GKI6nYDL9x1mjMNNJKY8034NgEr/5ND09cBiWhNkVGucU=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1589510015;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:CC:Subject:Reply-to:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=0dz0tsk8IyniG3Mpw42gBiYzPUtONnY4I4J1LK/ahDI=;
        b=apxtGyDt4sOno14UVkRhMgW0f0yaBqLCNuJfE2Tf+R1+PzupJKEJ6rPdyjMG6fUD
        uncU0+Xmy2jHgF6h89f4sAig+aBJg6uRv86+IqTgktelO3q3iO/TNlp5YzJdCXPSceJ
        9KFkOUnJ66eQl8vp9GUl+y22RDQef5Qz/97ZMl3A=
Received: from [127.0.0.1] (101.84.172.108 [101.84.172.108]) by mx.zoho.com.cn
        with SMTPS id 1589510013492869.4167107598075; Fri, 15 May 2020 10:33:33 +0800 (CST)
Date:   Fri, 15 May 2020 10:33:29 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
CC:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH 1/2] MIPS: Loongson: Fix fatal error during GPU init
User-Agent: K-9 Mail for Android
Reply-to: jiaxun.yang@flygoat.com
In-Reply-To: <1589508901-18077-1-git-send-email-yangtiezhu@loongson.cn>
References: <1589508901-18077-1-git-send-email-yangtiezhu@loongson.cn>
Message-ID: <ECE71DFC-57D3-4132-BB85-609448B29238@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B45=E6=9C=8815=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=881=
0:15:00, Tiezhu Yang <yangtiezhu@loongson=2Ecn> =E5=86=99=E5=88=B0:
>When ATI Radeon graphics card has been compiled directly into the kernel
>instead of as a module, we should make sure the firmware for the model
>(check available ones in /lib/firmware/radeon) is built-in to the kernel
>as well, otherwise there exists the following fatal error during GPU init=
,
>change CONFIG_DRM_RADEON=3Dy to CONFIG_DRM_RADEON=3Dm to fix it=2E
>

The commit message looks shocking=2E

You'd better reword it as "MIPS: Loongson64: Mark GPU driver as module in =
Kconfig"

Thanks=2E
--=20
Jiaxun Yang
