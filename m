Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77EE019D431
	for <lists+linux-mips@lfdr.de>; Fri,  3 Apr 2020 11:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727792AbgDCJnr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 3 Apr 2020 05:43:47 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17878 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390641AbgDCJnr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 3 Apr 2020 05:43:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585907008;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:To:CC:From:Message-ID;
        bh=uwI00vkAdOcq/o9zOC7ziAMTueymxQERCr5acZzaYa0=;
        b=YN8/SOTYB2iGMjJUSEKh6C/7aCTsUd0bCvMe1du1pCoNDeoa4EibUvcQAWbH6cLs
        mDMrs+pid3GkOKqud+9L/Ng13tTeaCzJg+0n5bVn47I79Lgb4wqDYT//7tKY80wVbXD
        +ua0nAySG1EClqvNFDag2Li0Flt0etE6Cuy0W4OU=
Received: from [10.233.233.252] (115.193.87.168 [115.193.87.168]) by mx.zoho.com.cn
        with SMTPS id 1585907006831778.1316964796324; Fri, 3 Apr 2020 17:43:26 +0800 (CST)
Date:   Fri, 03 Apr 2020 17:43:19 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <1585906191-26037-4-git-send-email-yangtiezhu@loongson.cn>
References: <1585906191-26037-1-git-send-email-yangtiezhu@loongson.cn> <1585906191-26037-4-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 3/3] MIPS: Loongson: Add PCI support for LS7A
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
CC:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <F8A72EE2-F609-47C7-9D99-0D1A4C342D7E@flygoat.com>
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B44=E6=9C=883=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=885:=
29:51, Tiezhu Yang <yangtiezhu@loongson=2Ecn> =E5=86=99=E5=88=B0:
>Add PCI support for LS7A to detect PCI device=2E
>
>Signed-off-by: Tiezhu Yang <yangtiezhu@loongson=2Ecn>

I'm going to convert Loongson PCI driver into Generic PCI Controller imple=
mentation=2E

My set have already included LS7A PCH support=2E

Anyway, thanks for your patch=2E
--=20
Jiaxun Yang
