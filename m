Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 686FC333C37
	for <lists+linux-mips@lfdr.de>; Wed, 10 Mar 2021 13:08:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbhCJMHa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Mar 2021 07:07:30 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:50857 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232752AbhCJMHE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Mar 2021 07:07:04 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 3113E173F;
        Wed, 10 Mar 2021 07:07:03 -0500 (EST)
Received: from imap1 ([10.202.2.51])
  by compute6.internal (MEProxy); Wed, 10 Mar 2021 07:07:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=Y6oI0uI0nWMx9MNRUrMEOrpOEzJTy6L
        P7lbYWOZ1nlU=; b=HWc2bfgseyo5tlVzcbVXzj12x6srQ5CjgurDOKU6AvYDfuQ
        hE/GQRm7wfEN9Sz/cttUwG9iq9inF9R+d9UQTP4B3QRxr0byzSWxO28JpYo76CG9
        vnX7/D2pugsK8ekboeFV6VLqnaSM15XBIjh7u1dOOFDmsVvP7tsnEM40C82/G7Lo
        +D+fl74e/Xxe3l169Hagxwzc32Kgz8OuAkdlS819ZtcHh6eRmWpb7DvVe5/GzG9v
        naKB+F5wla0lWFrnkgXq+sdJ6dGOg2RXcNnbeFdu/EsQBZ6Bj/S72UigROpwbjC6
        HBSxi/MphwlaXRZaMzWTFEYITucHxLOCdh39AqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Y6oI0u
        I0nWMx9MNRUrMEOrpOEzJTy6LP7lbYWOZ1nlU=; b=fy+Tq8DEWqgA+HLgSqy+PY
        Qns/IgB55uMn3OGo/HYJP6O08Vk7f5sWKJHapriRT7IdA57YNNHONMdRSwXTLNkm
        a9xdA/qkXCTnIuSQVmStgeb+nzkQrVTP7h+sJh2lG16VDbwjNHQQPkrEPcvwDeuS
        HQiOXb8PEdKv/Zmq82fCuzsvtFoGPyADn9ocnGu+GVSgyNnX0Tv2lsUK3RUBz2zq
        uq1EDNYKveS+cfh120nrJ14B1Zoslea/Xv1MuWVlv1kylX/mskQxoeM+9eso1Fxf
        N5SxRevELkk305ZrNaFGL+kV61Q7fGyZOC/BP4equSZ80aVn3NaDWlXD1vWSeCjA
        ==
X-ME-Sender: <xms:ZbZIYHoaXyVmA4jJza80PebSPgVdExtOLACtzUtpAkhNNKPrY3Js8w>
    <xme:ZbZIYBr-tddyeGzldtx3-id8oLRhSWHz4zjL0d_EeQO2fGSF0s66ljcaMrPAuUdNX
    0joX_87nuIWqWLiZXQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddukedgfeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdflihgr
    gihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpeevtdehveetkedvvdehhfeuueeffeduffduveevudeiveeu
    tedvheekteeujeegueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:ZbZIYEPlIB6maS5t_FvDqtDFxstvtwOzQNwK80ko-H4d9LyYdxOvHA>
    <xmx:ZbZIYK47oxrf8DPWk3mz8GH4qR19urseAvP7xCpmUXnlN3w9_ehpQA>
    <xmx:ZbZIYG6ByiP0_JZMgk2Ro3oY4KPuBaS9jxSd_Hxk3fYyo4f_pu5GMA>
    <xmx:ZrZIYNZCYweyndllhSqASAotumxIPfzff_7gJodKp9h-KBFNVap8ew>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 23680130005D; Wed, 10 Mar 2021 07:07:01 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-206-g078a48fda5-fm-20210226.001-g078a48fd
Mime-Version: 1.0
Message-Id: <8e445b26-db5c-48b8-8a16-f206cefae78b@www.fastmail.com>
In-Reply-To: <80471671-0e48-c4e7-5a99-f2fffff31a77@loongson.cn>
References: <20210310075639.20372-1-zhangqing@loongson.cn>
 <20210310075639.20372-4-zhangqing@loongson.cn>
 <cb549804-4ee1-79ab-d872-3e95bf0cbe55@gmail.com>
 <80471671-0e48-c4e7-5a99-f2fffff31a77@loongson.cn>
Date:   Wed, 10 Mar 2021 20:06:39 +0800
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "Qing Zhang" <zhangqing@loongson.cn>,
        "Sergei Shtylyov" <sergei.shtylyov@gmail.com>,
        "Huacai Chen" <chenhuacai@kernel.org>,
        "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
        "Thomas Gleixner" <tglx@linutronix.de>,
        "Marc Zyngier" <maz@kernel.org>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        "Ming Wang" <wangming01@loongson.cn>
Subject: =?UTF-8?Q?Re:_[PATCH_v4_3/7]_MIPS:_Loongson64:_Add_support_for_the_Loong?=
 =?UTF-8?Q?son-2K1000_to_get_cpu=5Fclock=5Ffreq?=
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On Wed, Mar 10, 2021, at 5:37 PM, zhangqing wrote:
> 
> 
> On 03/10/2021 04:50 PM, Sergei Shtylyov wrote:
> > Hello!
> >
> >    You don't seem to need this initializer.
> Hi,Sergei
> 
> Thanks for your suggestion,
> clk will not be affected by others when it is defined until the value is 
> obtained,
> =NULL can be deleted, but I think it seems to have no effect.

Please do reasonable change only.

Thanks.

- Jiaxun

> 
> Thanks,
> Qing
> >
> >
> 
>

-- 
- Jiaxun
