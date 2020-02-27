Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 302EF17170B
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2020 13:23:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729010AbgB0MXg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 Feb 2020 07:23:36 -0500
Received: from asavdk4.altibox.net ([109.247.116.15]:56864 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728929AbgB0MXg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 27 Feb 2020 07:23:36 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 0E14C804D0;
        Thu, 27 Feb 2020 13:23:26 +0100 (CET)
Date:   Thu, 27 Feb 2020 13:23:25 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Paul Boddie <paul@boddie.org.uk>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andi Kleen <ak@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
        linux-gpio@vger.kernel.org, kernel@pyra-handheld.com,
        letux-kernel@openphoenux.org
Subject: Re: [RFC 0/8] MIPS: CI20: add HDMI out support
Message-ID: <20200227122325.GA7587@ravnborg.org>
References: <cover.1582744379.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1582744379.git.hns@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=ptjrNaXRAAAA:8
        a=r_1tXGB3AAAA:8 a=ewWNKpoYB36fyWn1uZ8A:9 a=CjuIK1q_8ugA:10
        a=6TjziPoOuUJhFL2Tmcc1:22 a=t8nPyN_e6usw4ciXM-Pk:22
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus.

On Wed, Feb 26, 2020 at 08:12:52PM +0100, H. Nikolaus Schaller wrote:
> This patch series adds HDMI output to the jz4780/CI20 board.
> 
> It is based on taking the old 3.18 vendor kernel and trying
> to achieve the same with modern DTS setup and new/modified
> drivers.
> 
> Unfortunately, in this first RFC, only EDID and creation of
> /dev/fb0 are working. Also, HDMI hot plugging is detected.
> 
> But there is no HDMI output signal. So some tiny piece seems
> to be missing to enable/configure the Synposys HDMI controller.
> 
> We need help from the community to fix this.
> 
> Note: device tree bindings are from 2015 and still seem to
> fit - except they are not in yaml format.
> 
> Original authors of most patches are
> * Paul Boddie <paul@boddie.org.uk>
> * Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> 
> 
> H. Nikolaus Schaller (2):
>   drm: ingenic-drm: add MODULE_DEVICE_TABLE
>   MIPS: CI20: defconfig: configure for DRM_DW_HDMI_JZ4780
> 
> Paul Boddie (4):
>   drm: ingenic: add jz4780 Synopsys HDMI driver.
>   pinctrl: ingenic: add hdmi-ddc pin control group
>   MIPS: DTS: jz4780: account for Synopsys HDMI driver and LCD controller
>   MIPS: DTS: CI20: add HDMI setup
> 
> Zubair Lutfullah Kakakhel (2):
>   dt-bindings: video: Add jz4780-lcd binding
>   dt-bindings: video: Add jz4780-hdmi binding
> 
>  .../bindings/display/ingenic-jz4780-hdmi.txt  |  41 ++++++
>  .../bindings/display/ingenic-jz4780-lcd.txt   |  39 ++++++
New bindings in DT Schema format please...
We want to have then in a formal launguage so we can use these
to verify the DT files.

	Sam
