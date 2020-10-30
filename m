Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 646BD29FF08
	for <lists+linux-mips@lfdr.de>; Fri, 30 Oct 2020 08:46:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725808AbgJ3Hqa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Oct 2020 03:46:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:55756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725780AbgJ3Hqa (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 30 Oct 2020 03:46:30 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9EF0320719;
        Fri, 30 Oct 2020 07:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604043989;
        bh=XbzJCs+1Vbu1sG68hX1A1BQWrwJAMbx09Z0EixXEc0s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mVO09EOEVQDhIxqmOhZvn3m9RP1yKZhwB2NqZzP00ErBPlqSxU8VLeGJL+iVw4kbj
         DewkGZl/M3Nti9Ore8fBGWeevRbV3MJC+iGEhas49jvcEG/fLOnj8t5ple5dCiw5BW
         P1ipVg/apt56gRauVDsYN2Vz7SHtae83kdV+RQZ8=
Date:   Fri, 30 Oct 2020 15:46:17 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Alexander Dahl <post@lespocky.de>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Alexander Dahl <ada@thorsis.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH v7 08/12] ARM: dts: imx: Fix schema warnings for pwm-leds
Message-ID: <20201030074616.GI28755@dragon>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-9-post@lespocky.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201005203451.9985-9-post@lespocky.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Oct 05, 2020 at 10:34:47PM +0200, Alexander Dahl wrote:
> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).  Parent node name is not enforced, but recommended
> by DT project.
> 
>   DTC     arch/arm/boot/dts/imx53-ppd.dt.yaml
>   CHECK   arch/arm/boot/dts/imx53-ppd.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/imx53-ppd.dt.yaml: leds-brightness: 'alarm-brightness' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
>   DTC     arch/arm/boot/dts/imx6dl-cubox-i.dt.yaml
>   CHECK   arch/arm/boot/dts/imx6dl-cubox-i.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/imx6dl-cubox-i.dt.yaml: pwmleds: 'front' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
>   DTC     arch/arm/boot/dts/imx6dl-cubox-i-emmc-som-v15.dt.yaml
>   CHECK   arch/arm/boot/dts/imx6dl-cubox-i-emmc-som-v15.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/imx6dl-cubox-i-emmc-som-v15.dt.yaml: pwmleds: 'front' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
>   DTC     arch/arm/boot/dts/imx6dl-cubox-i-som-v15.dt.yaml
>   CHECK   arch/arm/boot/dts/imx6dl-cubox-i-som-v15.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/imx6dl-cubox-i-som-v15.dt.yaml: pwmleds: 'front' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
>   DTC     arch/arm/boot/dts/imx6sx-softing-vining-2000.dt.yaml
>   CHECK   arch/arm/boot/dts/imx6sx-softing-vining-2000.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/imx6sx-softing-vining-2000.dt.yaml: pwmleds: 'blue', 'green', 'red' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
> 
> Signed-off-by: Alexander Dahl <post@lespocky.de>

Applied, thanks.
