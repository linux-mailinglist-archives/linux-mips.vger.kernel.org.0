Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3F781B05B3
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 11:32:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbgDTJcP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 05:32:15 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17866 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725775AbgDTJcO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 20 Apr 2020 05:32:14 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1587375114; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=WwfkyFbcuXnFIazV/b/xCYn+RCxqzjkdrFPhj3trVx5QZLQfTgIgehU2EAdRQB2gRJtkjvd7XQwfF/8r6ihwtE2/hZvTYetzdENWO9MJzHubTiCdy/DfKvQw3AGJfKAWZPEQtUBs2n/kVFHkhnk77z47NbR6z4+4Z774zv304F4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1587375114; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:References:Subject:To; 
        bh=YWokOhjuoZJKbniCXhiZb2T0HCc4vugSkhCjBeD1p6M=; 
        b=XlKsNGl86xQB1J1JLN3M564gAhsNgoPRi1BEAoKrYjjiSp8TyEZ8rkT6dL1GgQ2+W58ZQWPGZWkXkLqjkbtwp0b4lYk6jB19vaOcUtaDixkUIxSgQu76J5OgqS5EwsftgSHGbP9cZsFqpEJnBpqbO4J0NW75i5HDoOaEsk3njVo=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1587375114;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:CC:Subject:Reply-to:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=YWokOhjuoZJKbniCXhiZb2T0HCc4vugSkhCjBeD1p6M=;
        b=d+DuWXGMpg3iToKjczmPbUL5Q9L9a+f4ZfNK/k3pD27VNs1Arucf5MNzFzbVujal
        k65yj4QlWG0kcIJNqYMeitByF5QOHF/5ZZkRigkxYI1AHik6SiMZ7zExzn0eGqXUb5p
        9Y0dnk23KN2c8leB2DacSCLO5wFCSwRx3IiSLp1I=
Received: from [127.0.0.1] (115.205.241.167 [115.205.241.167]) by mx.zoho.com.cn
        with SMTPS id 1587375111104526.5026860230735; Mon, 20 Apr 2020 17:31:51 +0800 (CST)
Date:   Mon, 20 Apr 2020 17:31:49 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 0/5] Loongson64: RS780E clean-ups
User-Agent: K-9 Mail for Android
Reply-to: jiaxun.yang@flygoat.com
In-Reply-To: <20200420090726.GA9388@alpha.franken.de>
References: <20200420073347.157230-1-jiaxun.yang@flygoat.com> <20200420090726.GA9388@alpha.franken.de>
Message-ID: <3C79E5D5-594D-4139-88CE-050BBD9C6D88@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B44=E6=9C=8820=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=885=
:07:26, Thomas Bogendoerfer <tsbogend@alpha=2Efranken=2Ede> =E5=86=99=E5=88=
=B0:
>On Mon, Apr 20, 2020 at 03:33:35PM +0800, Jiaxun Yang wrote:
>> Basically ensure all RS780E stuff is enabled by DeviceTree=2E
>> So I can post LS7A support later on=2E
>>=20
>> Hi Thomas, could you please pick them into MIPS tree?
>
>well, first patch doesn't apply, because it relies on your PCI patch
>series=2E I've fixed this while applying and then faced
>
>arch/mips/loongson64/pci=2Eo: In function `pcibios_init':
>pci=2Ec:(=2Einit=2Etext+0x44): undefined reference to `sbx00_acpi_init'
>
>IMHO there is something to improve=2E=2E=2E

Oops, sorry=2E
It should depends on PCI series=2E

I'll send v2 without this requirement soon=2E

Thanks=2E

>
>Thomas=2E
>

--=20
Jiaxun Yang
