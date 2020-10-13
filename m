Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5AA428C590
	for <lists+linux-mips@lfdr.de>; Tue, 13 Oct 2020 02:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726566AbgJMAPl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Oct 2020 20:15:41 -0400
Received: from relay5.mymailcheap.com ([159.100.241.64]:37869 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726394AbgJMAPk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 12 Oct 2020 20:15:40 -0400
Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.199.117])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id A7E852008F;
        Tue, 13 Oct 2020 00:15:36 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay4.mymailcheap.com (Postfix) with ESMTPS id DAF013F1D0;
        Tue, 13 Oct 2020 02:15:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id 0E1102A3E1;
        Mon, 12 Oct 2020 20:15:33 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1602548133;
        bh=5NmZlDTB2lauu72Cp0R1dqygEUHe74aaaaBzo97C13U=;
        h=Date:From:To:CC:Subject:In-Reply-To:References:From;
        b=Li+e9b6N6yOl517KIiePZfoFBEuTAQfQXeJ9I81apx5mkMQIO8GkpHYJ9m0xusiz8
         Eu39IEXYIyj1YcBeOxzAS7XUVY7GKZQRAhVhpxxOT0GTbY0lRGgUbYOWmu8dKP3ddZ
         wOXcHoCojzvJU6VsCkv9YVlZ3Y50poxT9pUOS0Zo=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id dSNRXE9ejvd2; Mon, 12 Oct 2020 20:15:31 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Mon, 12 Oct 2020 20:15:31 -0400 (EDT)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id C7AEB41A00;
        Tue, 13 Oct 2020 00:15:28 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="Qk8gEh4s";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [127.0.0.1] (unknown [113.52.132.214])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id CCB5D41A00;
        Tue, 13 Oct 2020 00:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1602548125;
        bh=5NmZlDTB2lauu72Cp0R1dqygEUHe74aaaaBzo97C13U=;
        h=Date:From:To:CC:Subject:In-Reply-To:References:From;
        b=Qk8gEh4sEPTR4Mpb+paJyIcNnBuKrl9NwdvE+4KANvYeQgs6qEV4XaXaTox3y3aSj
         vlXS+WrPwcvkQcdfmNE85G4UbuEs2c6oHVfdo0Awz1qPva+WRIRoY85DV6M8rb+aoS
         6JEGAspMH7AeWFStTQG3g/NEA7eoZhcU4utMFAbM=
Date:   Tue, 13 Oct 2020 08:15:15 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     Jonathan Corbet <corbet@lwn.net>, Huacai Chen <chenhc@lemote.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH v2 3/4 RESEND] MIPS: Loongson64: Add /proc/boardinfo
User-Agent: K-9 Mail for Android
In-Reply-To: <95060519-530b-c5f5-537d-a7b217b39003@loongson.cn>
References: <1602373674-4579-1-git-send-email-yangtiezhu@loongson.cn> <1602373674-4579-4-git-send-email-yangtiezhu@loongson.cn> <20201012103805.GC7953@alpha.franken.de> <95060519-530b-c5f5-537d-a7b217b39003@loongson.cn>
Message-ID: <3707A9AD-DD41-4DD0-A015-DE4DC33279DE@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: C7AEB41A00
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         ML_SERVERS(-3.10)[148.251.23.173];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         RCPT_COUNT_SEVEN(0.00)[8];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1]
X-Rspamd-Server: mail20.mymailcheap.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B410=E6=9C=8812=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=88=
8:02:25, Tiezhu Yang <yangtiezhu@loongson=2Ecn> =E5=86=99=E5=88=B0:
>On 10/12/2020 06:38 PM, Thomas Bogendoerfer wrote:
>> On Sun, Oct 11, 2020 at 07:47:53AM +0800, Tiezhu Yang wrote:
>>> Add /proc/boardinfo to get mainboard and BIOS info easily on the Loong=
son
>>> platform, this is useful to point out the current used mainboard type =
and
>>> BIOS version when there exists problems related with hardware or firmw=
are=2E
>>>
>>> E=2Eg=2E with this patch:
>>>
>>> [loongson@linux ~]$ cat /proc/boardinfo
>>> Board Info
>>> Manufacturer            : LEMOTE
>>> Board Name              : LEMOTE-LS3A4000-7A1000-1w-V01-pc
>>> Family                  : LOONGSON3
>>>
>>> BIOS Info
>>> Vendor                  : Kunlun
>>> Version                 : Kunlun-A1901-V4=2E1=2E3-20200414093938
>>> ROM Size                : 4 KB
>>> Release Date            : 2020-04-14
>> Why does Loongson64 need this extra file no other architecture or MIPS
>> platform need ? Do others provide this information via a different meth=
od ?
>> If yes, why can't Loongson64 do the same ?
>
>Hi Thomas,
>
>This is related with the implementation of firmware=2E
>
>Using dmidecode command can get the similar info if there exists SMBIOS
>in firmware, but the fact is there is no SMBIOS on some machines, we can
>see nothing when execute dmidecode, like this:
>
>[root@linux loongson]# dmidecode
># dmidecode 2=2E12
># No SMBIOS nor DMI entry point found, sorry=2E
>
>The following three structures are already defined in the interface
>specification about firmware and kernel on the Loongson platform,
>this is common requirement and specific for Loongson64, so add a
>new boardinfo=2Ec file in arch/mips/loongson64=2E
>
>arch/mips/include/asm/mach-loongson64/boot_param=2Eh
>struct interface_info {
>     u16 vers; /* version of the specificition */
>     u16 size;
>     u8  flag;
>     char description[64];
>} __packed;
>
>struct board_devices {
>     char name[64];    /* hold the device name */
>     u32 num_resources; /* number of device_resource */
>     /* for each device's resource */
>     struct resource_loongson resource[MAX_RESOURCE_NUMBER];
>     /* arch specific additions */
>     struct archdev_data archdata;
>};
>
>struct loongson_special_attribute {
>     u16 vers;     /* version of this special */
>     char special_name[64]; /* special_atribute_name */
>     u32 loongson_special_type; /* type of special device */
>     /* for each device's resource */
>     struct resource_loongson resource[MAX_RESOURCE_NUMBER];
>};

Hi Tiezhu,

Through I don't think touching top level of proc would be a good idea=2E I=
t's all about API consistency=2E

If you intend to provide user an interface then I guess /sys/firmware/lefi
like what DMI did or somewhere less critical is better=2E

There is no guarantee that Loongson64 device would come with LEFI,
although it's mandatory for now=2E

Thanks=2E

- Jiaxun

>
>Thanks,
>Tiezhu
>
>>
>> Thomas=2E
>>
