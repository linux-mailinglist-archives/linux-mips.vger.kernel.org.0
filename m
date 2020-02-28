Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16CBB17370C
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2020 13:16:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbgB1MQS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Feb 2020 07:16:18 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.169]:28470 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbgB1MQS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 28 Feb 2020 07:16:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582892176;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=/pGfs+Fcvd96yqGbcPc48p/hEAQ3m45dUh23TDSXiyE=;
        b=iYcVK30ff4LR3aNY9CcxoqAnKTB/+hH14ExivMlBoKxj78f+QwcFk0CtG78viySoCJ
        YSspNDSQelkiZgXGCtR3I6TmFXJqHatQfEqFLpQ/CwddX2tAtpEfz6kpluSk0GVjI5bY
        g/kXeFPfKJMUCitopmGXp6DM3IpM3l1BAJqzwosjekVZyTboGQnkfKyZzf1l4MbW+t/9
        SMaSFErLPE3Tw6j/TO4XEF9JcBgO27VDhQONYxqye9QGfVJ319NWT6WugiYFyeFj6TzF
        0CchyvAnP+Ij5zZJrq47n4DYOMVcI0FjxevSRH/5dyWf+ijQoIs6WmwMr1B1/i9ncBeJ
        cpHQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlaYXAcKqg=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
        with ESMTPSA id y0a02cw1SCG80hH
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 28 Feb 2020 13:16:08 +0100 (CET)
Subject: Re: [PATCH v6 1/6] nvmem: add driver for JZ4780 efuse
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=iso-8859-1
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <B30BD902-CF5D-421A-9BD5-5FA038895712@goldelico.com>
Date:   Fri, 28 Feb 2020 13:16:08 +0100
Cc:     PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Mathieu Malaterre <malat@debian.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andi Kleen <ak@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Content-Transfer-Encoding: 7bit
Message-Id: <E67D2DA7-2B02-4033-84D0-004A79ACA686@goldelico.com>
References: <cover.1582715761.git.hns@goldelico.com> <2a675558c6c7ba6df86669176004fe4703645793.1582715761.git.hns@goldelico.com> <1582814861.3.2@crapouillou.net> <B30BD902-CF5D-421A-9BD5-5FA038895712@goldelico.com>
To:     Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


>>> +	rd_adj = clk_rate / 153846154;
>>> +	rd_strobe = clk_rate / 28571429 - 5 - rd_adj + 1;
>>> +
>>> +	if (rd_adj > BIT(4) - 1 || rd_strobe > BIT(4) - 1) {
>> 
>> Just use 0xF or GENMASK(3, 0) instead of BIT(4) - 1
> 
> Or would rd_adj >= BIT(4) be better since this is not used as a mask?
> This would also correspond to that the register is 4 bits wide.

I just recognized that we already have these constants defined:

So I'll add

	if (rd_adj > EFUCFG_RD_ADJ_MASK || rd_strobe > EFUCFG_RD_STR_MASK) {

to v7.

BR,
Nikolaus
