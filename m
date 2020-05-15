Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDD931D43FB
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2020 05:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727924AbgEODS0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 23:18:26 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17768 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727869AbgEODSZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 14 May 2020 23:18:25 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1589512684; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=Kr82VYcwh3WX1pT2Oz1uE0TVVH+6tE7BKeDMG6WSj8nhIGEic/tb5AT080jfYk4Pqb71v13HBBK9pKrx5xre3BWuTUqkTISB0vsylpgZ4e1SlIuyWQY+gBjt2KrYh+EQ9tDdTnrr/BMSp6CFHUzx8Gan7YsdyCr03EKe2nXco5M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1589512684; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:References:Subject:To; 
        bh=a9MfE+IX939f7XSiZya+c23GX+UUfpJI7N9HjGVXA54=; 
        b=eJ5JcL/ZlMz4eaMd3GqcgEp6r20GUk1IVL9+wQunCYW9BKmaxCI3NSaKl8RCzN5FrsB0HBO2aW5eP4cHyHHQa7cMotSfw4Na/pw7DZ0U1UCt4CIVD8dl5DEZes4R8RlGT16MU+yPH9n7Chwq4PqPOxbSvomYrxZswQjkF9G9Nzc=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1589512684;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:CC:Subject:Reply-to:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=a9MfE+IX939f7XSiZya+c23GX+UUfpJI7N9HjGVXA54=;
        b=MaEKK/Mb8RQAk6lxjVcnvoEMdPLX2BhCBsjt91L3kre/rspxvztpC+xf1443+Xvq
        PJSPLMmdCZC/y5xktWkiGPG//Sip7wcFNMDIUb5whHJEi4/oXAxeuJC8QOQ8fEK775h
        kZoLMsY2Vt6J4dg35RuIgIdZywx6xovyv1Bw8oHY=
Received: from [127.0.0.1] (101.84.172.108 [101.84.172.108]) by mx.zoho.com.cn
        with SMTPS id 15895126814021012.4116349819437; Fri, 15 May 2020 11:18:01 +0800 (CST)
Date:   Fri, 15 May 2020 11:17:58 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
CC:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH 1/2] MIPS: Loongson: Fix fatal error during GPU init
User-Agent: K-9 Mail for Android
Reply-to: jiaxun.yang@flygoat.com
In-Reply-To: <636ba812-3849-2667-d625-ab7e35d5ac36@loongson.cn>
References: <1589508901-18077-1-git-send-email-yangtiezhu@loongson.cn> <ECE71DFC-57D3-4132-BB85-609448B29238@flygoat.com> <636ba812-3849-2667-d625-ab7e35d5ac36@loongson.cn>
Message-ID: <F7BAD661-9D82-4063-B685-4A7192B7F172@flygoat.com>
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
1:09:56, Tiezhu Yang <yangtiezhu@loongson=2Ecn> =E5=86=99=E5=88=B0:
>On 05/15/2020 10:33 AM, Jiaxun Yang wrote:
>>
>> =E4=BA=8E 2020=E5=B9=B45=E6=9C=8815=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=
=8810:15:00, Tiezhu Yang <yangtiezhu@loongson=2Ecn> =E5=86=99=E5=88=B0:
>>> When ATI Radeon graphics card has been compiled directly into the kern=
el
>>> instead of as a module, we should make sure the firmware for the model
>>> (check available ones in /lib/firmware/radeon) is built-in to the kern=
el
>>> as well, otherwise there exists the following fatal error during GPU i=
nit,
>>> change CONFIG_DRM_RADEON=3Dy to CONFIG_DRM_RADEON=3Dm to fix it=2E
>>>
>> The commit message looks shocking=2E
>>
>> You'd better reword it as "MIPS: Loongson64: Mark GPU driver as module =
in Kconfig"
>
>OK, I will modify the patch subject and send v2=2E

Sorry I meant defconfig not Kconfig=2E
>
>>
>> Thanks=2E
>

--=20
Jiaxun Yang
