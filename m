Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E2AB195109
	for <lists+linux-mips@lfdr.de>; Fri, 27 Mar 2020 07:27:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbgC0G1t (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 27 Mar 2020 02:27:49 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17875 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725857AbgC0G1t (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 27 Mar 2020 02:27:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585290402;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:To:CC:From:Message-ID;
        bh=UoGQjp02SZU51biG4JZ6PBIIfzrJ6T8Qawk+9xg9Btw=;
        b=MHijPGAJo0DC6YIAcR8HKhFTs0oCxZuOoFElNhvOFi1bVSjLyk2TXUPTLDllwwuN
        Bv5GOX6QjxvtsgCK5zGutXlHTTkOsmL2J0soTGrZZGrQTleIy03svp47bgFyWOvWYCS
        bRbPUH/XMeBmk8H17+3Zufbt27WIBYIwfJJVMWoo=
Received: from [10.233.233.252] (115.193.86.228 [115.193.86.228]) by mx.zoho.com.cn
        with SMTPS id 1585290398265664.6145661046983; Fri, 27 Mar 2020 14:26:38 +0800 (CST)
Date:   Fri, 27 Mar 2020 14:26:34 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <20200325132756.GA13750@infradead.org>
References: <1584932355-3642-1-git-send-email-yangtiezhu@loongson.cn> <1584932355-3642-3-git-send-email-yangtiezhu@loongson.cn> <20200325132756.GA13750@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/3] MIPS: Loongson: Add DMA support for 7A1000
To:     Christoph Hellwig <hch@infradead.org>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
CC:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <7786800D-3B37-4F0D-8E55-17F595D97EF2@flygoat.com>
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B43=E6=9C=8825=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=889=
:27:56, Christoph Hellwig <hch@infradead=2Eorg> =E5=86=99=E5=88=B0:
>On Mon, Mar 23, 2020 at 10:59:14AM +0800, Tiezhu Yang wrote:
>> Implement __phys_to_dma() and __dma_to_phys() according to the
>> node id offset in the 7A1000 DMA route config register=2E
>
>Can you please try to just use the dma_pfn_offset field in struct
>device
>for all loongson platforms?  I'm pretty sure I asked for that last time
>around=2E=2E

Here we have a problem that dma_pfn_offset doesn't fit our platform=2E

We have multiple dma-ranges that translate in to different address and
dma_pfn_offset can only handle single range=20
with fixed offset=2E

Thanks=2E

--=20
Jiaxun Yang
