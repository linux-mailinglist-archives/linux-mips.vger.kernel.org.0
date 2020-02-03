Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0ADE11505EE
	for <lists+linux-mips@lfdr.de>; Mon,  3 Feb 2020 13:14:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727708AbgBCMO2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 3 Feb 2020 07:14:28 -0500
Received: from mx2.suse.de ([195.135.220.15]:33590 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727201AbgBCMO2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 3 Feb 2020 07:14:28 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 4A2C5AD12;
        Mon,  3 Feb 2020 12:14:25 +0000 (UTC)
Date:   Mon, 3 Feb 2020 13:14:22 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Huacai Chen <chenhc@lemote.com>,
        Xuefeng Li <lixuefeng@loongson.cn>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Yinglu Yang <yangyinglu@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v2,RESEND] MIPS: Scan the DMI system information
Message-ID: <20200203131422.384cd168@endymion>
In-Reply-To: <a267161f-c8b3-a11c-7416-3ab9ba19aa82@loongson.cn>
References: <1579181165-2493-1-git-send-email-yangtiezhu@loongson.cn>
        <a267161f-c8b3-a11c-7416-3ab9ba19aa82@loongson.cn>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Tiezhun,

On Mon, 3 Feb 2020 16:32:03 +0800, Tiezhu Yang wrote:
> On 1/16/20 9:26 PM, Tiezhu Yang wrote:
> > Enable DMI scanning on the MIPS architecture, this setups DMI identifiers
> > (dmi_system_id) for printing it out on task dumps and prepares DIMM entry
> > information (dmi_memdev_info) from the SMBIOS table. With this patch, the
> > driver can easily match various of mainboards.
> >
> > In the SMBIOS reference specification, the table anchor string "_SM_" is
> > present in the address range 0xF0000 to 0xFFFFF on a 16-byte boundary,
> > but there exists a special case for Loongson platform, when call function
> > dmi_early_remap, it should specify the start address to 0xFFFE000 due to
> > it is reserved for SMBIOS and can be normally access in the BIOS.
> >
> > This patch works fine on the Loongson 3A3000 platform which belongs to
> > MIPS architecture and has no influence on the other architectures such
> > as x86 and ARM.
> >
> > Co-developed-by: Yinglu Yang <yangyinglu@loongson.cn>
> > Signed-off-by: Yinglu Yang <yangyinglu@loongson.cn>
> > [jiaxun.yang@flygoat.com: Refine definitions and Kconfig]
> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> > Reviewed-by: Huacai Chen <chenhc@lemote.com>
> > ---
> >
> > v2:
> >    - add SMBIOS_ENTRY_POINT_SCAN_START suggested by Jean
> >    - refine definitions and Kconfig by Jiaxun
> >
> >   arch/mips/Kconfig           | 10 ++++++++++
> >   arch/mips/include/asm/dmi.h | 20 ++++++++++++++++++++
> >   arch/mips/kernel/setup.c    |  2 ++
> >   drivers/firmware/dmi_scan.c |  6 +++++-
> >   4 files changed, 37 insertions(+), 1 deletion(-)
> >   create mode 100644 arch/mips/include/asm/dmi.h  
> 
> 
> Hi Paul and Jean,
> 
> How do you think this patch?

Looks good to me and you can add:

Reviewed-by: Jean Delvare <jdelvare@suse.de>

for the dmi subsystem part.

> 
> Should I split it into the following two patches?
> [PATCH v3 1/2] firmware: dmi: Add macro SMBIOS_ENTRY_POINT_SCAN_START
> [PATCH v3 2/2] MIPS: Add support for Desktop Management Interface (DMI)
> 
> The first patch is only related with the common dmi code
> drivers/firmware/dmi_scan.c, the other patch is only related
> with the mips code under arch/mips.
> 
> If you have any questions or suggestions, please let me know.
> I am looking forward to your early reply.

I'm fine either way. I you do not split it, as most changes are in the
mips arch files and I do not expect any conflict in the dmi subsystem
part, I believe that the patch should be merged by the mips arch
maintainer.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
