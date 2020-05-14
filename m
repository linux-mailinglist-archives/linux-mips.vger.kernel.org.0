Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F34DE1D2542
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 05:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725931AbgENDBQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 23:01:16 -0400
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243]:17454 "EHLO
        sender2-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725895AbgENDBP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 13 May 2020 23:01:15 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1589425264; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=VIsGblN2KUEoB2y4COsFCiKYppMB2jEf/FQYmnmcQsIJyfJXUqy3NtX0wrJrLRdgksjYi3vp5QW7RRfo/cPP4BE0xClukbFYgVL9wsNwPzT79aqxBQBi0+l/AYiNYpOwYZi4kGVa1SJSElKJcj7pHPteLnOZemRpPduVBJFBoAQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1589425264; h=Content-Type:Content-Transfer-Encoding:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:References:Subject:To; 
        bh=oi/fNbxcQfqV38u67GSmKWqpHjAnmzcR6V1yyCp18UQ=; 
        b=VvBZUvM2xEpdI5k+vxX1sk3Rn0DRchlqsVvX6yF4JxT2x1b04pewsoeV6VAhcAO0YUPcYbGrl91F2CuHVGKd3c5L4bZmZpjSWROLG6pPgMpC56qRofmTVBIZUEl1fOEgzZS34eSOzeajXgqRe3IAp+0enKa3BNV3avezWt/Fnd0=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1589425264;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:Subject:Reply-to:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=oi/fNbxcQfqV38u67GSmKWqpHjAnmzcR6V1yyCp18UQ=;
        b=J5FbEmVjCcRr4RHuSMs9EsSJYs6IpEGy+82GPNdcfzxs/mZhr4lqvrVrreOMWARc
        jBF1yLUHqc1L+zLtsJouaKk27lPhBSLcoLEISoyYqJVLiLXOR6pTTI9CXf9/GNYN3Se
        tQeBFRW7rkTzfs4aa6jdY3Uq15x83TNEFt8V5Lxc=
Received: from [127.0.0.1] (114.85.159.159 [114.85.159.159]) by mx.zoho.com.cn
        with SMTPS id 1589425260456590.3860532318491; Thu, 14 May 2020 11:01:00 +0800 (CST)
Date:   Thu, 14 May 2020 11:00:57 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     maobibo <maobibo@loongson.cn>,
        linux-mips <linux-mips@vger.kernel.org>
Subject: Re: rtc is missing with mips-next tree
User-Agent: K-9 Mail for Android
Reply-to: jiaxun.yang@flygoat.com
In-Reply-To: <14cd0164-bc85-4ca2-65b0-b41688e034dc@loongson.cn>
References: <14cd0164-bc85-4ca2-65b0-b41688e034dc@loongson.cn>
Message-ID: <9C1B22C8-F383-4E75-A237-FFA0E99CBCD6@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B45=E6=9C=8814=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=881=
0:28:16, maobibo <maobibo@loongson=2Ecn> =E5=86=99=E5=88=B0:
>
>Hi,
>
>On my rs780 machine with latest mips-next tree, rtc is missing with loong=
son3_defconfig
>
>Here is message:
>
>[root@mips-mainline test]# hwclock --debug
>hwclock from util-linux 2=2E23=2E2
>hwclock: cannot open /dev/rtc: No such file or directory
>No usable clock interface found=2E
>hwclock: Cannot access the Hardware Clock via any known method=2E
>
>[root@mips-mainline test]# date
>Thu Jan  1 08:16:56 CST 1970


I'll have a check later this month=2E
Sorry but my RS780E machine is not available now=2E

Thanks=2E

>
>
>regards
>bibo,mao
>

--=20
Jiaxun Yang
