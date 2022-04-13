Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 752744FF206
	for <lists+linux-mips@lfdr.de>; Wed, 13 Apr 2022 10:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbiDMIik (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Apr 2022 04:38:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbiDMIij (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 Apr 2022 04:38:39 -0400
X-Greylist: delayed 379 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 13 Apr 2022 01:36:19 PDT
Received: from relay.hostedemail.com (relay.hostedemail.com [64.99.140.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77FD962D3
        for <linux-mips@vger.kernel.org>; Wed, 13 Apr 2022 01:36:19 -0700 (PDT)
Received: from omf12.hostedemail.com (a10.router.float.18 [10.200.18.1])
        by unirelay13.hostedemail.com (Postfix) with ESMTP id E6D7960B0F;
        Wed, 13 Apr 2022 08:29:57 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf12.hostedemail.com (Postfix) with ESMTPA id D72BC1D;
        Wed, 13 Apr 2022 08:29:54 +0000 (UTC)
Message-ID: <d0ed8518dfb93e6f2bbbaf4aac3436dd20369c00.camel@perches.com>
Subject: Re: [PATCH 08/14] MAINTAINERS: add Ralink pinctrl driver
From:   Joe Perches <joe@perches.com>
To:     =?UTF-8?Q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Luiz Angelo Daros de Luca <luizluca@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     erkin.bozoglu@xeront.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Date:   Wed, 13 Apr 2022 01:29:53 -0700
In-Reply-To: <20220413060729.27639-9-arinc.unal@arinc9.com>
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
         <20220413060729.27639-9-arinc.unal@arinc9.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Stat-Signature: zhuoxxoync4pzqz7sdbq39i3jeft38mk
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: D72BC1D
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18hGnWBYKAheXpW4IDdjP9YcLGcKeoboe4=
X-HE-Tag: 1649838594-350832
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 2022-04-13 at 09:07 +0300, Arınç ÜNAL wrote:
> Add a new section for the Ralink pinctrl driver and add me and Sergio as
> the maintainers.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>

It's unusual for a last name to be completely capitalized.

> diff --git a/MAINTAINERS b/MAINTAINERS
[]
> @@ -16502,6 +16502,13 @@ L:	linux-mips@vger.kernel.org
>  S:	Maintained
>  F:	arch/mips/boot/dts/ralink/mt7621*
>  
> +RALINK PINCTRL DRIVER
> +M:	Arınç ÜNAL <arinc.unal@arinc9.com>
> +M:	Sergio Paracuellos <sergio.paracuellos@gmail.com>
> +L:	linux-mips@vger.kernel.org
> +S:	Maintained
> +F:	drivers/pinctrl/ralink/*

Typically this is just the directory.

F:	drivers/pinctrl/ralink/

as this covers any file in the directory as well as
any possible subdirectories and files.

Using

F:	drivers/pinctrl/ralink/*

excludes any possible subdirectories and files within those
possible subdirectories.


