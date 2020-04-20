Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 813F71B0C66
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 15:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbgDTNPu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 09:15:50 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17830 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726049AbgDTNPu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 20 Apr 2020 09:15:50 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1587388518; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=bnitXJ6a5awYMcxWW+C35z/i3wlEbUXAGAEF3Vr3PnGr3Zd4DV6H1WNb3ucn5QqMxhYKsY89WrMGn18COeDuxvidBLr8zrJ/zT+gUnRiqtcw7uY7yz9ADTfwOp7bO1ydXQMlC63Jn8hRntXiYrud5aecVa3fo6rQHzqkIIIrzcg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1587388518; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:References:Subject:To; 
        bh=m4ElzxvozIiJ7VtYC556c5aJNi4fFs2JdOzX4iTtIo0=; 
        b=m/OIjwU5t1A7V8M6IN65/LkA+HDzvNTVl36M+q+0quJdys2oHGmKju8rCZ7u1iS6qObFHoLf7+HUKLuLYlyhjBu19L7V0MEFV2CqdLvBP5DQ3Ph5R7t7rSCnN6wkHwaj8KhgfL+rXeOiryWpsKBCPUxEa1uXNeTDSEvkEyis/JY=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1587388518;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:CC:Subject:Reply-to:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=m4ElzxvozIiJ7VtYC556c5aJNi4fFs2JdOzX4iTtIo0=;
        b=goRgelHeylk+CXxKkvSFHVPAE3/YCHE8eojrE9VZaL02o7PzOe0jnY3J+wd3PvqQ
        PlHdxSBVoF8sO8KcNsp9YxWD7Q2ug36TbSKq7E2JNazVIwv6eKxt6vx3Orx9CchVaLw
        W+ctDD+4a3bZszmw7jGH68ebHfAEq15qCYWXnv0s=
Received: from [127.0.0.1] (115.205.241.167 [115.205.241.167]) by mx.zoho.com.cn
        with SMTPS id 1587388514770656.1781461570575; Mon, 20 Apr 2020 21:15:14 +0800 (CST)
Date:   Mon, 20 Apr 2020 21:15:13 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     maobibo <maobibo@loongson.cn>
CC:     linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 1/5] MIPS: Loongson64: Remove dead RTC code
User-Agent: K-9 Mail for Android
Reply-to: jiaxun.yang@flygoat.com
In-Reply-To: <cd4b67eb-d689-793b-93b3-1ba2b3741b5b@loongson.cn>
References: <20200420073347.157230-1-jiaxun.yang@flygoat.com> <20200420073347.157230-2-jiaxun.yang@flygoat.com> <15923f8b-7278-f510-e06a-99751bd68048@loongson.cn> <20200420201312.7afe1bb7@flygoat-x1e> <cd4b67eb-d689-793b-93b3-1ba2b3741b5b@loongson.cn>
Message-ID: <D208EF92-2C67-4DD5-9CE7-1E99B1ABC9CD@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B44=E6=9C=8820=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=889=
:04:52, maobibo <maobibo@loongson=2Ecn> =E5=86=99=E5=88=B0:
>
>
>On 04/20/2020 08:13 PM, Jiaxun Yang wrote:
>> Hi Bibi,
>>=20
>> Thanks for your review=2E
>>=20
>> Pretty sure=2E It is mc146818 specified, it can never work on LS7A/LS2K
>> which have another RTC implementation=2E
>>=20
>> I have performed boot test with this patch=2E
>> Kernel have safety fallback on platforms without this callback=2E=20
>Although it boots ok, the wall time will be 0 for every boot since it doe=
s not read from rtc

Not a big deal :-)

It must be removed unless we can come out a solution
fits both mc146818 and Loongson's in-house design RTC=2E

Thanks
>
>regards
>bibo, mao
>

--=20
Jiaxun Yang
