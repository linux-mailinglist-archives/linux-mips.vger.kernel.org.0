Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67FC71BA847
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2020 17:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbgD0PqY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 27 Apr 2020 11:46:24 -0400
Received: from mail-ej1-f68.google.com ([209.85.218.68]:42580 "EHLO
        mail-ej1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726539AbgD0PqY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Apr 2020 11:46:24 -0400
Received: by mail-ej1-f68.google.com with SMTP id pg17so14477745ejb.9;
        Mon, 27 Apr 2020 08:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=vN8ZtTEMOm40Zgoqr2j2go1H/JlhYwioxL2VoPsyXMo=;
        b=cTxh2TAcHuZX30NEGByeXRxLV/yCkaoG+WLOckufPxWBnuYBAhDbkhQ5M8GynJgIwu
         dgIWjI21OAwfJjP4dN9FRBTZgHoZORDAXNUBEhxskYf5SLItKg/f/uDyrB3PtNv/Uavu
         Yj0foPRbTyYUMxvBL+UiLKZkXGrINEFS46KZUCQE3rbfcX8vsLrkQb3vlM+1agiuFJ8C
         dLx3f3/fY4GW2vZlR4USC9jaY/eNjnA/cfrB+4047NZpqmHViB6338VM6e5E2o8hEMNI
         8pfW2pN13ATQCjqxcGOpeOb6dYJpaWeBR3xMYdC3r4wqaUBH+/d3n7GgSSXgoRcSHWCn
         EeBA==
X-Gm-Message-State: AGi0PuZ0/uWdnyqjT+DE+fTlNibCpkq1PLiGM0pX4hTjt2jYIXseadgb
        CeAiosruEjlY9RrY8US9wYQ=
X-Google-Smtp-Source: APiQypJaGHIqdott9ULGc1vIvIC2hB4wMVjvSOJwybdeeq2XFdtUhgVC8YxEO2xmFZWEXRWg3+ZkRg==
X-Received: by 2002:a17:906:3713:: with SMTP id d19mr19332049ejc.111.1588002380871;
        Mon, 27 Apr 2020 08:46:20 -0700 (PDT)
Received: from pi3 ([194.230.155.237])
        by smtp.googlemail.com with ESMTPSA id v14sm1947180edx.67.2020.04.27.08.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 08:46:20 -0700 (PDT)
Date:   Mon, 27 Apr 2020 17:46:17 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Jonathan Bakker <xc-racer2@live.ca>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Philipp Rossak <embed3d@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v7 08/12] arm: dts: s5pv210: Add node for SGX 540
Message-ID: <20200427154617.GA1798@pi3>
References: <cover.1587760454.git.hns@goldelico.com>
 <3fd18c747426e15fd1f3500b9c4adce2db9ddd0c.1587760454.git.hns@goldelico.com>
 <NYBE9Q.YH08US7A7DC3@crapouillou.net>
 <BN6PR04MB0660A180D2069848E5C03D7EA3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <BN6PR04MB0660A180D2069848E5C03D7EA3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Apr 26, 2020 at 07:57:12AM -0700, Jonathan Bakker wrote:
> Hi Paul,
> 
> On 2020-04-26 5:56 a.m., Paul Cercueil wrote:
> > 
> > 
> > Le ven. 24 avril 2020 à 22:34, H. Nikolaus Schaller <hns@goldelico.com> a écrit :
> >> From: Jonathan Bakker <xc-racer2@live.ca>
> >>
> >> All s5pv210 devices have a PowerVR SGX 540 (revision 120) attached.
> >>
> >> There is no external regulator for it so it can be enabled by default.
> >>
> >> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> >> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> >> ---
> >>  arch/arm/boot/dts/s5pv210.dtsi | 13 +++++++++++++
> >>  1 file changed, 13 insertions(+)
> >>
> >> diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
> >> index 2ad642f51fd9..abbdda205c1b 100644
> >> --- a/arch/arm/boot/dts/s5pv210.dtsi
> >> +++ b/arch/arm/boot/dts/s5pv210.dtsi
> >> @@ -512,6 +512,19 @@ vic3: interrupt-controller@f2300000 {
> >>              #interrupt-cells = <1>;
> >>          };
> >>
> >> +        gpu: gpu@f3000000 {
> >> +            compatible = "samsung,s5pv210-sgx540-120";

This should not pass the bindings check because you missed last
compatibles.

> >> +            reg = <0xf3000000 0x10000>;
> >> +            interrupt-parent = <&vic2>;
> >> +            interrupts = <10>;
> >> +            clock-names = "core";
> >> +            clocks = <&clocks CLK_G3D>;
> >> +
> >> +            assigned-clocks = <&clocks MOUT_G3D>, <&clocks DOUT_G3D>;
> >> +            assigned-clock-rates = <0>, <66700000>;
> >> +            assigned-clock-parents = <&clocks MOUT_MPLL>;
> > 
> > What are these clocks for, and why are they reparented / reclocked?
> > 
> > Shouldn't they be passed to 'clocks' as well?
> > 
> > -Paul
> > 
> 
> The G3D clock system can have multiple parents, and for stable operation
> it's recommended to use the MPLL clock as the parent (which in turn
> is actually a mux as well).  MOUT_G3D is simply the mux for CLK_G3D
> (SGX core clock), DOUT_G3D is the divider.  DOUT_G3D could equally be CLK_G3D
> (and probably should be, for readability) as CLK_G3D is simply the gate and
> DOUT_G3D is the divider for it.

Good point, it should be CLK_G3D instead of DOUT.  Can you fix this as
well?

Best regards,
Krzysztof
