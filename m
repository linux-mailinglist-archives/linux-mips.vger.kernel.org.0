Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCDDA1524E2
	for <lists+linux-mips@lfdr.de>; Wed,  5 Feb 2020 03:55:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727736AbgBECzq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Feb 2020 21:55:46 -0500
Received: from forward500o.mail.yandex.net ([37.140.190.195]:50375 "EHLO
        forward500o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727708AbgBECzp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 Feb 2020 21:55:45 -0500
Received: from mxback7q.mail.yandex.net (mxback7q.mail.yandex.net [IPv6:2a02:6b8:c0e:41:0:640:cbbf:d618])
        by forward500o.mail.yandex.net (Yandex) with ESMTP id D8B5660038;
        Wed,  5 Feb 2020 05:55:39 +0300 (MSK)
Received: from localhost (localhost [::1])
        by mxback7q.mail.yandex.net (mxback/Yandex) with ESMTP id Fne5RH1nOD-tcLaxcjS;
        Wed, 05 Feb 2020 05:55:39 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1580871339;
        bh=Dvb46oX+sE51AQniYvfHyEhRnuBAEmi6TNyag+qriXY=;
        h=Message-Id:Cc:Subject:In-Reply-To:Date:References:To:From;
        b=g04rv893wsQtgKA8TQyHo7W76jEiPFv+TD97j46ucKKn3w/aAVN2PHq0SHui5kPdA
         YVFjhIn8HaTwq8jFFX3d1oQTbF92sj73dwHpfg9HTn7RuqFZlnVYJ1MOiuW+6aSJ4P
         oEbnW0eIecaOX5jQz0QmeJ/+InC6CVX0TiMAcZRU=
Authentication-Results: mxback7q.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by vla4-87a00c2d2b1b.qloud-c.yandex.net with HTTP;
        Wed, 05 Feb 2020 05:55:38 +0300
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Envelope-From: yjx@flygoat.com
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Huacai Chen <chenhc@lemote.com>,
        Xuefeng Li <lixuefeng@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yinglu Yang <yangyinglu@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Jean Delvare <jdelvare@suse.com>,
        Jean Delvare <jdelvare@suse.de>
In-Reply-To: <609c7042-0e44-2bd4-5e03-97465621b184@loongson.cn>
References: <1579181165-2493-1-git-send-email-yangtiezhu@loongson.cn>
         <a267161f-c8b3-a11c-7416-3ab9ba19aa82@loongson.cn>
         <20200203131422.384cd168@endymion> <609c7042-0e44-2bd4-5e03-97465621b184@loongson.cn>
Subject: Re: [PATCH v2,RESEND] MIPS: Scan the DMI system information
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date:   Wed, 05 Feb 2020 10:55:38 +0800
Message-Id: <17537451580871338@vla4-87a00c2d2b1b.qloud-c.yandex.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> On 2/3/20 8:14 PM, Jean Delvare wrote:
> 
>> Hi Tiezhun,
>>
>> On Mon, 3 Feb 2020 16:32:03 +0800, Tiezhu Yang wrote:
>>
>>> On 1/16/20 9:26 PM, Tiezhu Yang wrote:
>>>
>>>> Enable DMI scanning on the MIPS architecture, this setups DMI identifiers
>>>> (dmi_system_id) for printing it out on task dumps and prepares DIMM entry
>>>> information (dmi_memdev_info) from the SMBIOS table. With this patch, the
>>>> driver can easily match various of mainboards.
>>>>
>>>> In the SMBIOS reference specification, the table anchor string "_SM_" is
>>>> present in the address range 0xF0000 to 0xFFFFF on a 16-byte boundary,
>>>> but there exists a special case for Loongson platform, when call function
>>>> dmi_early_remap, it should specify the start address to 0xFFFE000 due to
>>>> it is reserved for SMBIOS and can be normally access in the BIOS.
>>>>
>>>> This patch works fine on the Loongson 3A3000 platform which belongs to
>>>> MIPS architecture and has no influence on the other architectures such
>>>> as x86 and ARM.
>>>>
>>>> Co-developed-by: Yinglu Yang <yangyinglu@loongson.cn>
>>>> Signed-off-by: Yinglu Yang <yangyinglu@loongson.cn>
>>>> [jiaxun.yang@flygoat.com: Refine definitions and Kconfig]
>>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>>>> Reviewed-by: Huacai Chen <chenhc@lemote.com>
>>>> ---
>>>>
>>>> v2:
>>>> - add SMBIOS_ENTRY_POINT_SCAN_START suggested by Jean
>>>> - refine definitions and Kconfig by Jiaxun
>>>>
>>>> arch/mips/Kconfig | 10 ++++++++++
>>>> arch/mips/include/asm/dmi.h | 20 ++++++++++++++++++++
>>>> arch/mips/kernel/setup.c | 2 ++
>>>> drivers/firmware/dmi_scan.c | 6 +++++-
>>>> 4 files changed, 37 insertions(+), 1 deletion(-)
>>>> create mode 100644 arch/mips/include/asm/dmi.h
>>>
>>> Hi Paul and Jean,
>>>
>>> How do you think this patch?
>>
>> Looks good to me and you can add:
>>
>> Reviewed-by: Jean Delvare <jdelvare@suse.de>
>>
>> for the dmi subsystem part.
>>
>>> Should I split it into the following two patches?
>>> [PATCH v3 1/2] firmware: dmi: Add macro SMBIOS_ENTRY_POINT_SCAN_START
>>> [PATCH v3 2/2] MIPS: Add support for Desktop Management Interface (DMI)
>>>
>>> The first patch is only related with the common dmi code
>>> drivers/firmware/dmi_scan.c, the other patch is only related
>>> with the mips code under arch/mips.
>>>
>>> If you have any questions or suggestions, please let me know.
>>> I am looking forward to your early reply.
>>
>> I'm fine either way. I you do not split it, as most changes are in the
>> mips arch files and I do not expect any conflict in the dmi subsystem
>> part, I believe that the patch should be merged by the mips arch
>> maintainer.
> 
> Hi Jean,
> 
> Thanks very much for your review.
> 
> As described in another mail [1] by MIPS maintainer Paul Burton:
> 
> "So if unmerged arch/mips/ patches are holding you up, ping me, but
> preferrably make sure code being added actually belongs under arch/mips/
> first."
> 
> I think it is better to split it into the following two patches?
> [PATCH v3 1/2] firmware: dmi: Add macro SMBIOS_ENTRY_POINT_SCAN_START
> [PATCH v3 2/2] MIPS: Add support for Desktop Management Interface (DMI)

Hi Tiezhu,

That way will break bisect. In this case, I think the patch should still go through MIPS
tree after grab review or ack from DMI maintainer.

There is a grey margin for tree-wide patches, we should discuss how to deal with them case by
case, for the email you mentioned, the main focus is platform driver. 

Thanks.

--

Jiaxun Yang
