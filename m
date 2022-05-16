Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B48F1528113
	for <lists+linux-mips@lfdr.de>; Mon, 16 May 2022 11:52:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240813AbiEPJwj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 May 2022 05:52:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241564AbiEPJwe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 16 May 2022 05:52:34 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A560AE66
        for <linux-mips@vger.kernel.org>; Mon, 16 May 2022 02:52:20 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 2599F5C0131;
        Mon, 16 May 2022 05:52:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 16 May 2022 05:52:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1652694738; x=
        1652781138; bh=SZ13pwsy92l3ohFkD5FLOoXYKo+Z0gUBGMWontvhRF4=; b=D
        ctfXVcC67ar/5yrB0XRJAUnWtcInM1BZW1XYJCxRrQoVLsAz9afpn1vFp8XB1nbC
        E+yf+xvQfsOJylVjIc17ltlcx4VQIem9OjA/iBiXEY0boyzMezl41t+b5jUinYo/
        CKhH1NGkEFhVQ8QRTEmGStxFU6X+kloQ3QjaxarBUj5/Lq1nzel+iYJb0QWqrLcP
        hAqsnPlwTdYXN3EWPR7R17NRHf2XJviLFds7vY58qDQf/b/E/Cr2iHw7b6l02DcB
        AwSUmDG98hS28Ly2Hhz+V6xJJj2v81ZuScsQv5MvlcdxzBPnkMrcNj0ewPVECkm3
        8TR6I7H+oFy6O2lAmNFHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:date:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1652694738; x=1652781138; bh=SZ13pwsy92l3ohFkD5FLOoXYKo+Z
        0gUBGMWontvhRF4=; b=fJH5r0pTcJNdJPHkHSyuqkbxG8zy4f+1vp+v+3IYxQYb
        l4rvF3cY0s780G6CrXNxS6hhM2H9GNn986SNKGyVHRDY4BJKwNu75wTcXXRi2Ngg
        V/3MXx7dF7CxArK35Mdf/NnPtucOQ8DY+1RmeDiJGOq7AlKoM1NuU0Cn9hgZZN+0
        dsNkT1jHJ3FDQsSmhXf0zUN+SPyZSe581dBzPMcqh53JFAKrlS39RWM4EXEbHWMy
        9BfyLJ/4HiuhskhCbJ5Yxt9w4AvQxztvwkCq6zmrnWqyDhI1xjLdypiwhv7W7Pss
        RjKXg6gGyln7dWJckHsihEYlDxSEOfWxy0FNJwDj7w==
X-ME-Sender: <xms:0R6CYsH5IbsF1SHCAjqcwhRawLhgaLRj7WIGpnRFRK3WAzJZGNdENw>
    <xme:0R6CYlXZvBdN9XzIT99a9ValIOwZac2zfhDDTPhNAo6zEQkiM48NnzlrIGQmNsXHp
    -AwJaffk1riMHdPmkU>
X-ME-Received: <xmr:0R6CYmI_Z84xVuSGv0H2VkChmhCbVVXTyWOBuoruAj3_aqvJDsAPezZ7gMFm7d0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrheehgddulecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfuvfhfhfgjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihu
    nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
    ftrfgrthhtvghrnhepteegvdfgjedvgeetleevudfggffhudelhfegtddvveelgefggeeg
    vdfhudeggfeknecuffhomhgrihhnpegrohhstgdrihhonecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihg
    ohgrthdrtghomh
X-ME-Proxy: <xmx:0R6CYuF0I1SZgITME70Ad8KsG6dyhGgJ_cp0Lybnh5qTcUYnro8C-Q>
    <xmx:0R6CYiWuysdC14pCiH6qqLbaId0iSx-svCEVJ7kiFqElKFBaeMJ6Mw>
    <xmx:0R6CYhMAxEov_aDAtyYnd7uGYEVWFkiXjrmiBJBI4W9wQ4kQ9hsHaA>
    <xmx:0h6CYrcmJOsoHRzxsZro0UCvX8dTLFAA-TRL8F6XjIeFPT1ZCQRERg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 May 2022 05:52:17 -0400 (EDT)
Message-ID: <bd4731d2-e285-fd47-040f-dc7d9ceaa4bf@flygoat.com>
Date:   Mon, 16 May 2022 10:52:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Any Linux MIPS distribution that still supports Lemote Yeeloong?
Content-Language: en-GB
To:     Jan Prunk <janprunk@gmail.com>, linux-mips@vger.kernel.org
References: <CALnoPX5iSE+uNE+fADiSkO-YrPZ+1Dxac5a=Rw012E9hj6Gr=w@mail.gmail.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <CALnoPX5iSE+uNE+fADiSkO-YrPZ+1Dxac5a=Rw012E9hj6Gr=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

AOSC/Retro[1] supports Yeeloong presently.
Their package are updated annually so you may not expect it to be a
state-of-art distro but it provides modern Linux desktop experiences.

Thanks
- Jiaxun

[1]: https://wiki.aosc.io/aosc-os/retro/intro/

在 2022/5/15 18:14, Jan Prunk 写道:
> Hello,
>
> I am interested, if there is a Linux distribution that still has an
> active (updated) port for the Loongson2f based Lemote Yeeloong 8089B
> computer? AFAIK I was only able to find the active port in Gentoo, but
> haven't tried it yet.
>
> Best regards,
> Jan

