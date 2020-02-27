Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 846F81717ED
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2020 13:57:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729072AbgB0M5M (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 Feb 2020 07:57:12 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:16197 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729052AbgB0M5M (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 27 Feb 2020 07:57:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582808229;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=EHgVmvZBm7FfOuRidNTu7QhYG4ewtZHDd8hCpQzwN2Q=;
        b=c2wVMIZTfqD2nSvBfByPStDh8GB9l6h/fSUPzIguOqBArUUUg6DJNI0MK378VPNOrb
        vKxq1AMza6s3e96demUW0X8AAZuJElKKWwcRa+JIWIjOGRx6QuLpIKEzzcKfz3oNQ9nD
        A0OR5rMfqAq3IZ2IoEUOoNzcthusMRUg1XYZy24yRtgsVjxMTKTMo3NLpP5rUDRqJ5xD
        MopDATaaEO4UdIaJx2ljDd3hrAlAVVfSESc9VQEL0M2ATZivvgiO5emV4LnDnizSmkkD
        NrkDDPzBor3odLbO/cfV7D/SR+WZWgst9CERkMmU4eN4Joy4b344C6Eq7W4ELUVBYsDG
        cElA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBp5hRw/qOxWRk4dCygV4+2OGxpoAr2x7EvFYqujh1U+3K41Uc/x8xM"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2001:16b8:2655:a800:8035:ee61:8f08:2eb7]
        by smtp.strato.de (RZmta 46.1.12 AUTH)
        with ESMTPSA id U06217w1RCuoAsJ
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 27 Feb 2020 13:56:50 +0100 (CET)
Subject: Re: [RFC 0/8] MIPS: CI20: add HDMI out support
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200227122325.GA7587@ravnborg.org>
Date:   Thu, 27 Feb 2020 13:56:56 +0100
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
Content-Transfer-Encoding: 7bit
Message-Id: <8EE60F87-415A-44EA-AA49-632E232095FF@goldelico.com>
References: <cover.1582744379.git.hns@goldelico.com> <20200227122325.GA7587@ravnborg.org>
To:     Sam Ravnborg <sam@ravnborg.org>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Sam,

> Am 27.02.2020 um 13:23 schrieb Sam Ravnborg <sam@ravnborg.org>:
> 
> Hi Nikolaus.
> 
> On Wed, Feb 26, 2020 at 08:12:52PM +0100, H. Nikolaus Schaller wrote:
>> This patch series adds HDMI output to the jz4780/CI20 board.
>> 
>> It is based on taking the old 3.18 vendor kernel and trying
>> to achieve the same with modern DTS setup and new/modified
>> drivers.
>> 
>> Unfortunately, in this first RFC, only EDID and creation of
>> /dev/fb0 are working. Also, HDMI hot plugging is detected.
>> 
>> But there is no HDMI output signal. So some tiny piece seems
>> to be missing to enable/configure the Synposys HDMI controller.
>> 
>> We need help from the community to fix this.
>> 
>> Note: device tree bindings are from 2015 and still seem to
>> fit - except they are not in yaml format.
>> 
>> Original authors of most patches are
>> * Paul Boddie <paul@boddie.org.uk>
>> * Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
>> 
>> 
>> H. Nikolaus Schaller (2):
>>  drm: ingenic-drm: add MODULE_DEVICE_TABLE
>>  MIPS: CI20: defconfig: configure for DRM_DW_HDMI_JZ4780
>> 
>> Paul Boddie (4):
>>  drm: ingenic: add jz4780 Synopsys HDMI driver.
>>  pinctrl: ingenic: add hdmi-ddc pin control group
>>  MIPS: DTS: jz4780: account for Synopsys HDMI driver and LCD controller
>>  MIPS: DTS: CI20: add HDMI setup
>> 
>> Zubair Lutfullah Kakakhel (2):
>>  dt-bindings: video: Add jz4780-lcd binding
>>  dt-bindings: video: Add jz4780-hdmi binding
>> 
>> .../bindings/display/ingenic-jz4780-hdmi.txt  |  41 ++++++
>> .../bindings/display/ingenic-jz4780-lcd.txt   |  39 ++++++
> New bindings in DT Schema format please...
> We want to have then in a formal launguage so we can use these
> to verify the DT files.

Yes, I know. And I fully support the goal.

But I personally do not have the time to learn the (IMHO brain-twisting)
way the Schema format is working. Especially, I am not interested
in becoming volunteer translator for .txt based schemas developed
by someone else.

So I hope that someone from the community can and is willing to do
that.

Or that there will appear good tools soon. E.g. some GUI
based editor tool would be very helpful so that you don't have
to fight with the yaml indentation rules. Like there are XML
and DTD editors. And even HTML is rarely written manually any more.

IMHO such tools should have been developed and in place *before*
the rule to provide DT schemata is enforced.

Anyways, I have requested for comments (and did expect this one).

BR and thanks,
Nikolaus

