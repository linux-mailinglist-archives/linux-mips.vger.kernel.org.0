Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 140DC522D6
	for <lists+linux-mips@lfdr.de>; Tue, 25 Jun 2019 07:31:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727047AbfFYFbH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 Jun 2019 01:31:07 -0400
Received: from mx2.mailbox.org ([80.241.60.215]:55718 "EHLO mx2.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726009AbfFYFbH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 25 Jun 2019 01:31:07 -0400
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx2.mailbox.org (Postfix) with ESMTPS id 62D64A0034;
        Tue, 25 Jun 2019 07:31:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de [80.241.56.123]) (amavisd-new, port 10030)
        with ESMTP id qSrK4hawJXXU; Tue, 25 Jun 2019 07:31:00 +0200 (CEST)
Subject: Re: [PATCH 8/8 v2] MIPS: ralink: Add GARDENA smart Gateway MT7688
 board
To:     Paul Burton <paul.burton@mips.com>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        John Crispin <john@phrozen.org>
References: <20190527091323.4582-1-sr@denx.de>
 <20190527091323.4582-8-sr@denx.de>
 <20190624212959.he2xf4pkm35c7k53@pburton-laptop>
From:   Stefan Roese <sr@denx.de>
Message-ID: <c102edbb-c322-28e7-0b98-54e446ce1872@denx.de>
Date:   Tue, 25 Jun 2019 07:31:00 +0200
MIME-Version: 1.0
In-Reply-To: <20190624212959.he2xf4pkm35c7k53@pburton-laptop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 24.06.19 23:30, Paul Burton wrote:
> On Mon, May 27, 2019 at 11:13:23AM +0200, Stefan Roese wrote:
>> This patch adds support for the GARDENA smart Gateway, which is based on
>> the MediaTek MT7688 SoC. It is equipped with 128 MiB of DDR and 8 MiB of
>> flash (SPI NOR) and additional 128MiB SPI NAND storage.
>>
>> Signed-off-by: Stefan Roese <sr@denx.de>
>> Cc: Paul Burton <paul.burton@mips.com>
>> Cc: Harvey Hunt <harveyhuntnexus@gmail.com>
>> Cc: John Crispin <john@phrozen.org>
>> ---
>> v2:
>> - Use Harvey's new email address (not at imgtec)
>> - Use correct linux-mips list address
>>
>>   .../ralink/gardena_smart_gateway_mt7688.dts   | 196 ++++++++++++++++++
>>   1 file changed, 196 insertions(+)
>>   create mode 100644 arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
> 
> Thanks for the patch - this one sees checkpatch complain about the
> Gardena DT vendor prefix being undocumented, as well as the board
> compatible string:
> 
> WARNING: DT compatible string "Gardena,smartGatewayMT7688" appears un-documented -- check ./Documentation/devicetree/bindings/
> #40: FILE: arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts:14:
> +       compatible = "Gardena,smartGatewayMT7688", "ralink,mt7628a-soc";
> 
> WARNING: DT compatible string vendor "Gardena" appears un-documented -- check ./Documentation/devicetree/bindings/vendor-prefixes.yaml
> #40: FILE: arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts:14:
> +       compatible = "Gardena,smartGatewayMT7688", "ralink,mt7628a-soc";
> 
> Could you add the entry to
> Documentation/devicetree/bindings/vendor-prefixes.yaml & a short
> description of the board somewhere like
> Documentation/devicetree/bindings/mips/ralink/gardena.txt?

Sure, I'll send a new version of this patch with these additions.

Thanks,
Stefan
