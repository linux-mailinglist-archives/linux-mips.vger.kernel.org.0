Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5787E300132
	for <lists+linux-mips@lfdr.de>; Fri, 22 Jan 2021 12:12:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727890AbhAVLIA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Jan 2021 06:08:00 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:59473 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726951AbhAVLGD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 22 Jan 2021 06:06:03 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id F35395804D2;
        Fri, 22 Jan 2021 06:04:54 -0500 (EST)
Received: from imap1 ([10.202.2.51])
  by compute6.internal (MEProxy); Fri, 22 Jan 2021 06:04:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=rb8WI8sXlnPVRNuGTmVdhmUl+IEK1di
        iS3ygw9Wmb54=; b=SaAmT+HOKGy0/ab/ecbGQ6QDetCdYh0tkm+DSqVf2MfRD/K
        b5qMX1ganZMSpX7GrImt39jZqDB0R+O7fzVauG5MMiFqEbW9S+tKGSVr0NeT2Vj6
        ZJ+Yi1Ya0KmLgL92jMY+Voh07QR4YrT4+l95myDl00t0oF7v3/LaYaVSIBIHbC9v
        oqc3hcMP7vccxVMM0820zG9MvRankftmXIfNBPVM9NSCOGC13CTP4mnshf8A2X+x
        /dThaAg6d17r12432RMmOHabHlbRxQmANMTINTIOkUnQZE/QkAXgSVQ+ryATmV2m
        59WZPPlfOzYmSwnUZx4YUM6AxCHMRhY/jwdlweA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=rb8WI8
        sXlnPVRNuGTmVdhmUl+IEK1diiS3ygw9Wmb54=; b=XjboQvyFRpU4UDwQkjw52l
        Eha1b8Qk8fwXfOP0GK4ygYyvhJWF2Zadl6kNtiwq/5nqiHw3G+tZgDVI9e4iZl3C
        Ohds/oDWtGLJE6FEieagaTz9iKKAlh9g3tJKS1vl2TWVNXZctkBG8UvOjPAq+iY1
        Q7CUCmslpWg+ZpMaiuEMBGKY6ayajzfrTA0TCCbCAxmrMUqVUZz7m9Pc7IsQJGfe
        KjuKTTYusdUPOn3/7K9PaTKvLyPOimlr/hY10d+QhY6gXIwO+0zVDrZzVyIxBCwe
        cnUte+YtuRjIoUyMudIiuA/KWhbR6bk2B+eYnv5Dc6OMAjSVNWnIdx5N0O1FjXEA
        ==
X-ME-Sender: <xms:VbEKYC9bCEgyXeChK-ZqDlaKHjGC3hlfPITOoroVFOQW3m5p5jxIWg>
    <xme:VbEKYCspxUbAPvCrCeFX79JQoMgwdKsKZYEeKiorKX6wrwWuuqlyp-I10Bu55vfJ3
    AHBmAWD23HfXW8e1VM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeigddviecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedflfhirgig
    uhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvedtheevteekvddvhefhueeufeefudffudevveduieevueet
    vdehkeetueejgeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:VbEKYICB83lGAs6c8k_elaDwHHCBQ7TBh2V7wNxkmfsFE8rOSQWKSA>
    <xmx:VbEKYKeP6llBWKs9UdpLqSNGD7bmJuLopeYnH1bPylUBTnGub89kJg>
    <xmx:VbEKYHP4JoJb8WWAgxD5Hr4UjS7Fo7rM1AwGfbDE5SGi6wPsM-Oizg>
    <xmx:VrEKYAaBvw3Jmn8oJhxfixdW5OdOZ0dcmGord1CGOkug44uHu85bnw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 626F3130005D; Fri, 22 Jan 2021 06:04:53 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-78-g36b56e88ef-fm-20210120.001-g36b56e88
Mime-Version: 1.0
Message-Id: <4d8daf29-4fcc-49ff-b212-8891b7075293@www.fastmail.com>
In-Reply-To: <20210122105101.GD8146@alpha.franken.de>
References: <20210121013435.450471-1-siyanteng@loongson.cn>
 <20210121013435.450471-2-siyanteng@loongson.cn>
 <20210122105101.GD8146@alpha.franken.de>
Date:   Fri, 22 Jan 2021 19:04:31 +0800
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
        "Yanteng Si" <siyanteng@loongson.cn>
Cc:     "Huacai Chen" <chenhuacai@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        siyanteng01@gmail.com
Subject: =?UTF-8?Q?Re:_[PATCH_2/2]_MIPS:_mm:_Add_prototype_for_function_=5F=5Func?=
 =?UTF-8?Q?ached=5Faccess?=
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On Fri, Jan 22, 2021, at 6:51 PM, Thomas Bogendoerfer wrote:
> On Thu, Jan 21, 2021 at 09:34:35AM +0800, Yanteng Si wrote:
> > This commit adds a prototype to fix error at W=1:
> > 
> > arch/mips/mm/cache.c:211:12: error: no previous prototype
> > for '__uncached_access' [-Werror=missing-prototypes]
> > 
> > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> > ---
> >  arch/mips/include/asm/pgtable.h | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
> > index 804889b70965..76d36484a0ad 100644
> > --- a/arch/mips/include/asm/pgtable.h
> > +++ b/arch/mips/include/asm/pgtable.h
> > @@ -65,6 +65,7 @@ struct vm_area_struct;
> >  
> >  extern unsigned long _page_cachable_default;
> >  extern void __update_cache(unsigned long address, pte_t pte);
> > +extern int __weak __uncached_access(struct file *file, unsigned long addr);
> 
> I'm in favour of removing __uncached_access(). Is there a real good reason
> for the special loongson2ef treatment ?

It was used to workaround a mesa bug which may access VRAM without O_SYNC.

I believe it's nolonger required after ~10 years.
Yanteng, you can just remove that.

Thanks.

> 
> Thomas.
> 
> -- 
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
>

-- 
- Jiaxun
