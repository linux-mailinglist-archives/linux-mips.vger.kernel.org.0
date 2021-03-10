Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A26C333EDD
	for <lists+linux-mips@lfdr.de>; Wed, 10 Mar 2021 14:37:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233167AbhCJN1w (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Mar 2021 08:27:52 -0500
Received: from mout.gmx.net ([212.227.17.21]:41921 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232898AbhCJN1f (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Mar 2021 08:27:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1615382820;
        bh=pp0VmHnVkKH81usf4fvgy+XxSQVUMpzj42YCLwf4NGA=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=Bv97yvOMJtihwj72A1OYSCDXtE8iKfsGj002G7CYgWJWLIB8QnfF1pyKLmwfLYRL4
         ITaWwmSq9+7CCpyoUm4Q3N6Gmdc34DxWH+2IuXqYWCtiOoWep1wcEZKYMMiH+wzsT0
         7BDikapuVEZV2ebUbkltY469bUGCnSTanGWD5jJ4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.55] ([95.91.192.147]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MgNh1-1lxBEp29pn-00hyS4; Wed, 10
 Mar 2021 14:27:00 +0100
Subject: Re: [PATCH v4 2/7] MIPS: Loongson64: Distinguish firmware
 dependencies DTB/LEFI
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Qing Zhang <zhangqing@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ming Wang <wangming01@loongson.cn>
References: <20210310075639.20372-1-zhangqing@loongson.cn>
 <20210310075639.20372-3-zhangqing@loongson.cn>
 <2484af69-13d1-09ff-3785-6c89cac4ffbd@rempel-privat.de>
 <49ddbef4-3d2a-4adb-8fd0-37bba0530c4c@www.fastmail.com>
From:   Oleksij Rempel <linux@rempel-privat.de>
Message-ID: <7f26fc67-e7b1-d305-90e7-0cfedcc822ca@rempel-privat.de>
Date:   Wed, 10 Mar 2021 14:26:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <49ddbef4-3d2a-4adb-8fd0-37bba0530c4c@www.fastmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5D+UVeipRKNhZqgNEc5ybjhJZjHnpu1ZugPFt41sOk2uFETwoec
 2aQCw4o51YD/czHcSkD/sAiGyQv9Ub3rHOmjb8mloH6ESLG/0CW974lNtWerntM1UsXdTI3
 rT0hfPqTkRmIVUMWUJeYpjtDxDoEIHA6TEEI3mpLRHpF8D4Z7tQsXLpb80wnt8bSWeFQcv3
 I/1IkVh0wcuEMzQS9w2Ow==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:r9aKnxEft44=:Bszziqi4h9B5rQ9WAPExoU
 L9ZOIzAQLqyH5mnO0/ITIZZFpRePLM3ynMElTTI+i3yXgg4SVsH2eEpySn+4YzGop4U3waUNk
 m9cR2yDaL4//vTjSZSUAni7YtgA3UcRYlZp4ujh9DM+EuMZSUkEKGb8/7WrpURc5JoKLrIZ1R
 W8bGl8hmnB5wlYRrv7slYzg6qdaWKto5QR6BT1LlQt3Gm5APJ/KJL8QQvvjyXnnj6jpcNxhxq
 tF6bGJjfkgAWTAbJYeuf+7oZ5GGOq45dwled6mXoq3I5XuQ8zC1weoBj0wg/9HeiTYRUm65Ox
 TxX+qk5oJTyBYD/0/sGfNr2/EUQMqaXqn3dr+ksY5a25XjhmhtDmYeurzRJd6w0uyM0ISq+Jd
 s8vxxg517LghxjKEobHhR2EgckT2yapY71kS0UA1Ay6Fag+o8WjTFum30p40fXaJtlHZ4/XPc
 9i9GjipCOjHE8uaLelHl6x+drXDoXbAYwROjWkJC0LPhJUDjXPhDhHiXayUoTKA6iL53vpzoj
 GBLllPN2Vu+QDHHSn3aDYIyoZ3CxHA5UpChY718mahwNO3OAcxE2WRVkZFjlfuGDraPwyZ/ts
 uHh0PqkC57/45t5GEE92BVDxaGTiOKZe4H+AS6msURIh7TAtgPGiZoISzytvA2tjAJukQuk8s
 PV9lQm5Op8Gz4AIGHfVZVPOhXNpOvYZNWzHe1imZbVVsS/s9QRGlY1TKKDqpfh594wb9vM+n3
 /eGidr/poPFLFot7hsBD/17qyFS11VZVNxAbgjDXSBAq/b3mxyHQQvwBUVskDrbooqIepx02I
 NYFxu1F34tAD5c2hUuw9rjJP8C3vSqhkScKITbN5blrBJHsSDT7seZhjSRFsiXPjRe1fjGTR+
 DmkHDZiwozg+N4xpTciw==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Am 10.03.21 um 13:12 schrieb Jiaxun Yang:
>
>
> On Wed, Mar 10, 2021, at 6:57 PM, Oleksij Rempel wrote:
>> Hi,
>>
>> Am 10.03.21 um 08:56 schrieb Qing Zhang:
>>> Add DTB boot support, only support Loongson-2K1000 processor
>>> for now, determine whether to use the built-in DTB or the DTB
>>> from the firmware by checking the range of CKSEG0 and XKPHYS.
>>> loongson_fw_interface will be used in the future.
>>>
>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
>>> Tested-by: Ming Wang <wangming01@loongson.cn>
>>> ---
>>>
>>> v3-v4: Standard submission of information
>>>        Fix error handling
>>>
>>>  .../include/asm/mach-loongson64/boot_param.h     |  6 ++++++
>>>  arch/mips/include/asm/mach-loongson64/loongson.h |  3 ++-
>>>  arch/mips/loongson64/env.c                       | 13 ++++++++++++-
>>>  arch/mips/loongson64/init.c                      | 16 ++++++++++++++-=
-
>>>  4 files changed, 34 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch=
/mips/include/asm/mach-loongson64/boot_param.h
>>> index 4592841b6b0c..43737401dc06 100644
>>> --- a/arch/mips/include/asm/mach-loongson64/boot_param.h
>>> +++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
>>> @@ -198,7 +198,13 @@ enum loongson_bridge_type {
>>>  	VIRTUAL =3D 3
>>>  };
>>>
>>> +enum loongson_fw_interface {
>>> +	LOONGSON_LEFI,
>>> +	LOONGSON_DTB,
>>> +};
>>> +
>>>  struct loongson_system_configuration {
>>> +	enum loongson_fw_interface fw_interface;
>>>  	u32 nr_cpus;
>>>  	u32 nr_nodes;
>>>  	int cores_per_node;
>>> diff --git a/arch/mips/include/asm/mach-loongson64/loongson.h b/arch/m=
ips/include/asm/mach-loongson64/loongson.h
>>> index ac1c20e172a2..3f885fa26ba6 100644
>>> --- a/arch/mips/include/asm/mach-loongson64/loongson.h
>>> +++ b/arch/mips/include/asm/mach-loongson64/loongson.h
>>> @@ -23,7 +23,8 @@ extern u32 memsize, highmemsize;
>>>  extern const struct plat_smp_ops loongson3_smp_ops;
>>>
>>>  /* loongson-specific command line, env and memory initialization */
>>> -extern void __init prom_init_env(void);
>>> +extern void __init prom_dtb_init_env(void);
>>> +extern void __init prom_lefi_init_env(void);
>>>  extern void __init szmem(unsigned int node);
>>>  extern void *loongson_fdt_blob;
>>>
>>> diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
>>> index 51a5d050a94c..e7d3a06175e3 100644
>>> --- a/arch/mips/loongson64/env.c
>>> +++ b/arch/mips/loongson64/env.c
>>> @@ -43,7 +43,18 @@ const char *get_system_type(void)
>>>  	return "Generic Loongson64 System";
>>>  }
>>>
>>> -void __init prom_init_env(void)
>>> +
>>> +void __init prom_dtb_init_env(void)
>>> +{
>>> +	if ((fw_arg2 < CKSEG0 || fw_arg2 > CKSEG1)
>>> +		&& (fw_arg2 < XKPHYS || fw_arg2 > XKSEG))
>>> +
>>> +		loongson_fdt_blob =3D __dtb_loongson64_2core_2k1000_begin;
>>> +	else
>>> +		loongson_fdt_blob =3D (void *)fw_arg2;
>>> +}
>>> +
>>> +void __init prom_lefi_init_env(void)
>>>  {
>>>  	struct boot_params *boot_p;
>>>  	struct loongson_params *loongson_p;
>>> diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
>>> index cfa788bca871..ed280b73bf89 100644
>>> --- a/arch/mips/loongson64/init.c
>>> +++ b/arch/mips/loongson64/init.c
>>> @@ -52,6 +52,10 @@ void __init szmem(unsigned int node)
>>>  	static unsigned long num_physpages;
>>>  	u64 node_id, node_psize, start_pfn, end_pfn, mem_start, mem_size;
>>>
>>> +	/* Otherwise come from DTB */
>>> +	if (loongson_sysconf.fw_interface !=3D LOONGSON_LEFI)
>>> +		return;
>>> +
>>>  	/* Parse memory information and activate */
>>>  	for (i =3D 0; i < loongson_memmap->nr_map; i++) {
>>>  		node_id =3D loongson_memmap->map[i].node_id;
>>> @@ -94,12 +98,20 @@ static void __init prom_init_memory(void)
>>>  void __init prom_init(void)
>>>  {
>>>  	fw_init_cmdline();
>>> -	prom_init_env();
>>> +
>>> +	if (fw_arg2 =3D=3D 0 || (fdt_magic(fw_arg2) =3D=3D FDT_MAGIC)) {
>>> +		loongson_sysconf.fw_interface =3D LOONGSON_DTB;
>>> +		prom_dtb_init_env();
>>> +	} else {
>>> +		loongson_sysconf.fw_interface =3D LOONGSON_LEFI;
>>> +		prom_lefi_init_env();
>>> +	}
>>
>> Is it possible to make it compatible with MIPS UHI boot protocol? So
>> boot loaders will be able to
>> handle Loongson kernel images as any other MIPS kernel images?
>
> Hmm, as Loongson did many stuff in non-generic manner it's almost imposs=
ible :-(
> Also their are many devices shipped with current boot protocol.

I would like to understand, why it is impossible. Do fw_arg0 provide memor=
y address or some kind of
count/size? Can it be negative?

We already had same situation with ARM and it was fixed. Why this can't be=
 done for MIPS or LS?

>
>>
>> This protocol is described here on page 15, "3. Boot protocols"
>> https://docplayer.net/62444141-Unified-hosting-interface-md01069-refere=
nce-manual.html
>>
>> According to this protocol, you should have:
>> fw_arg0 =3D -2
>> fw_arg1 =3D Virtual (kseg0) address of Device Tree Blob
>>
>> This would made LS a first grade resident for many boot loaders and
>> save a lot of needles headaches.
>
> Loongson is stepping away from MIPS and it seems like they're going to u=
se EDK-II for their Loongarch.

It seems to be UEFI related, it seems to be not related to the CPU arch, o=
r do i'm missing something?

In any case, if this is true, then it means, that Loongsoon is about to dr=
op support for old boot
loaders (PMON?) and do new thing (one more boot protocol?). So argumentati=
on, we upstream old own
protocol, but will drop it to make some thing new is not really good examp=
le :)

> TBH I've checked Loongson's PMON code and realized it can't be ported to=
 other projects easily.
> Tons of unregonized assembly code.

No need to port it. Here is example of working clean code:
https://git.pengutronix.de/cgit/barebox/tree/arch/mips/boards/loongson-ls1=
b/lowlevel.S

And this boot loader would boot any

=2D-
Regards,
Oleksij
