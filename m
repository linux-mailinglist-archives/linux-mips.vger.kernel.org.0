Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48BE932AF55
	for <lists+linux-mips@lfdr.de>; Wed,  3 Mar 2021 04:25:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233882AbhCCARl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Mar 2021 19:17:41 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:52295 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1444111AbhCBCjk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Mar 2021 21:39:40 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 0021C109C;
        Mon,  1 Mar 2021 21:27:44 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Mon, 01 Mar 2021 21:27:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=/
        /gbrRneuXQ8PYBLHAooCmvbqBKxLnuewss1ximJRjY=; b=kzYMJr0SFGyFeRLLw
        37rm6J3N86B7AmgxQGe1owM5lVNQUjT7epcA04dTl7RwcJtqWv4IKRNZP5mLxCSi
        UcfjkBsDbDmN0IbP14jpQUkvoKE8uvvNV2qKl6z6ue8jv6AhZA+82JCZr7EZUUZc
        OzRCYejYM442ufdDd/Tij8eXlPHyGoW0RqtgTUAPpZ6WKOlnHHgm7maKr46ZzP/i
        gGJfYX0rqTF8WH0S8DQZgIiXVc7dJbTmZ/u5A/c7gTddDcXsv3apmTOSorgmvu8V
        cZSFLmbEGYN9d0rMh5KrIVqNnVETBU8zlc7GhSJ3NgQFcm1Nlc+apN4ZdVsiFteS
        xQoAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=//gbrRneuXQ8PYBLHAooCmvbqBKxLnuewss1ximJR
        jY=; b=agqhp0tCc4foYE//oROKhFMyxOfxiYiRsSzBqGshIX5arV5/6kGx6QpVc
        bLaIJmVfwsPf4ilv7K2sa/8aaV1z2Z0JvjxG7dUxTPnuv9KdX1nL0obnTPT/eutV
        G+sHY9RHUJN9HsQ2HJBR5iDXOq/36GnzHRVKGZvB8ZTAobS9zrFXgKavTROi7Shf
        NDaw0btT93ZrU4pl2xYR2uc9vM6nCvtEd8ahbQGmijKeUGbMuVBlI1ionr2IK6RH
        Y464oIa3jTBDpTdxSlG/2Iwqu8UoI7yMm0cUc4vcc4HLiB5+z2/36XsFvvQ7JGag
        ALCHM/oD1mm6xmh3PzQDycwbv1UHA==
X-ME-Sender: <xms:n6I9YJhZePblU1mRNgrrDAVinzdoERYwMiWIKib1K9ZfMb77K-qmbg>
    <xme:n6I9YODR0sF52QD7ol5Jvw-vXmn6mq4GYrltpeYni9hTJ_FEqARtv3Q2wKKI8TJrP
    NtLvwjIas2n5dxv57w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleelgdegiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeftnecuhfhrohhmpeflihgrgihu
    nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
    ftrfgrthhtvghrnhepfeeludeitddvkeffgefgueekjeegfeefteelgffhkeffueetieej
    geehhfeuffdvnecukfhppeeghedrfeefrdehtddrvdehgeenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhih
    ghhorghtrdgtohhm
X-ME-Proxy: <xmx:n6I9YJH0MqG738tCl8IAwbT5rUYy-63ZG7QubEpm_JUYHwzYyfjpyQ>
    <xmx:n6I9YOTT--IWeIwgoGKFOaO2wSKUip1qThOx2MWwpaWW5TBwjZbBHw>
    <xmx:n6I9YGzUCzBk3S1aatNFcAuz--BkM6ppJwp0qNM24VFiFW8QUiZyMg>
    <xmx:oKI9YK-3RENV4HWIQnXQEMBBXqV7-VCuSkwVbXc4MXWGfPiynXYhlQ>
Received: from [127.0.0.1] (li1000-254.members.linode.com [45.33.50.254])
        by mail.messagingengine.com (Postfix) with ESMTPA id AB34A1080057;
        Mon,  1 Mar 2021 21:27:41 -0500 (EST)
Subject: Re: [PATCH 1/2] MIPS: Remove KVM_GUEST support
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210301152958.3480-1-tsbogend@alpha.franken.de>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <6a746cc8-0a72-c73b-c6bf-780c6ed68d0c@flygoat.com>
Date:   Tue, 2 Mar 2021 10:27:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210301152958.3480-1-tsbogend@alpha.franken.de>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2021/3/1 ÏÂÎç11:29, Thomas Bogendoerfer Ð´µÀ:
> KVM_GUEST is broken and unmaintained, so let's remove it.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

I'll prepare a patch for KVM side removal.

Thanks.

- Jiaxun
