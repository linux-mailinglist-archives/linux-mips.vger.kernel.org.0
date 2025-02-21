Return-Path: <linux-mips+bounces-7886-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A40EA3F08F
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2025 10:39:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B56AB1881B58
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2025 09:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5734204698;
	Fri, 21 Feb 2025 09:38:14 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AEE4204681;
	Fri, 21 Feb 2025 09:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740130694; cv=none; b=aW0DnEbVJ+JKvf95/1tl762i9C08aAEJfJws8QE4e9KmpgpFdcRQvU3/mTf0HIaKs418/nIcoBdmf1XpBJ7XheEll3donf14+0OIBz6818CgAdeN9jex+zeIkGukdTsVGEZjF5v1tsqgHyKw9Ga5QZIAYoKmnnL8RA0w4csfgCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740130694; c=relaxed/simple;
	bh=EJx2vfs/+2gpk8AKPvz/birlYYWJkI2Q7eInv+jf3Ew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ny0JuSkYbF8YLW8/O3q16QwnG4YQJUfU5GE84yADYznS5WIaLscC0Ja31mJxrpZGOBbCiniWJYyLlgrbqWhX/7ml0o7YPiuPgoLNL9VU5nscWZhsdZ+FTknhUFig4I2yVzLvUUBXKeFSxlNDMdRYMhoe2zNv9DPVbUukmpEUm8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tlPU1-0006Eb-00; Fri, 21 Feb 2025 10:38:09 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id C726BC0135; Fri, 21 Feb 2025 10:37:26 +0100 (CET)
Date: Fri, 21 Feb 2025 10:37:26 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Rob Herring <robh@kernel.org>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] dt-bindings: mips: mips-cm: Add a new compatible
 string for EyeQ6
Message-ID: <Z7hJVnJSg3C9lmLY@alpha.franken.de>
References: <20250123-cluster-hci-broken-v3-0-8a7ec57cbf68@bootlin.com>
 <20250123-cluster-hci-broken-v3-2-8a7ec57cbf68@bootlin.com>
 <afa2e874-c078-4c3e-b485-d948a0bb6a6f@app.fastmail.com>
 <CAL_JsqKXYruNn+MtxbvCCWU2OmqeV-uAyyzN+F-ppSJVscr91w@mail.gmail.com>
 <bf08785b-9963-4539-92ef-b73c3abe8c19@app.fastmail.com>
 <87tt9iucu9.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87tt9iucu9.fsf@BLaptop.bootlin.com>

On Tue, Jan 28, 2025 at 05:23:26PM +0100, Gregory CLEMENT wrote:
> > 在2025年1月27日一月 下午10:07，Rob Herring写道：
> >> On Mon, Jan 27, 2025 at 3:43 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
> >>>
> >>>
> >>>
> >>> 在2025年1月23日一月 上午11:01，Gregory CLEMENT写道：
> >>> > The CM3.5 used on EyeQ6 reports that Hardware Cache Initialization is
> >>> > complete, but in reality it's not the case. It also incorrectly
> >>> > indicates that Hardware Cache Initialization is supported. This new
> >>> > compatible string allows warning about this broken feature that cannot
> >>> > be detected at runtime.
> >>> >
> >>> > Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> >>> > ---
> >>> >  Documentation/devicetree/bindings/mips/mti,mips-cm.yaml | 12 +++++++++++-
> >>> >  1 file changed, 11 insertions(+), 1 deletion(-)
> >>> >
> >>> > diff --git a/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
> >>> > b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
> >>> > index
> >>> > 4324b2306535f1bf66c44b1f96be9094ee282041..d129d6382847768dc026336d8d2c7328b6b81f9b
> >>> > 100644
> >>> > --- a/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
> >>> > +++ b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
> >>> > @@ -19,7 +19,12 @@ maintainers:
> >>> >
> >>> >  properties:
> >>> >    compatible:
> >>> > -    const: mti,mips-cm
> >>> > +    oneOf:
> >>> > +      - const: mti,mips-cm
> >>> > +      - const: mobileye,eyeq6-cm
> >>> > +        description:
> >>> > +          On EyeQ6 the HCI (Hardware Cache Initialization) information for
> >>> > +          the L2 cache in multi-cluster configuration is broken.
> >>> >
> >>> >    reg:
> >>> >      description:
> >>> > @@ -44,4 +49,9 @@ examples:
> >>> >        compatible = "mti,mips-cm";
> >>> >        reg = <0x1bde8000 0x8000>;
> >>> >      };
> >>> > +
> >>> > +  - |
> >>> > +    coherency-manager {
> >>> > +      compatible = "mobileye,eyeq6-cm";
> >>>
> >>> I think “mobileye,eyeq6-cm”, “mti,mips-cm” would describe the hardware better as eyeq6’s CM is just a special variant of mips-cm.
> >>
> >> Is s/w that only understands “mti,mips-cm” useful on eyeq6 chip? If
> >> so, I agree. If not, then a fallback compatible is not useful.
> >
> > Yes, mobileye,eyeq6-cm only enable an additional bug workaround in software.
> >
> 
> Having "mti,mips-cm" is not useful for the EyeQ6 chip. On the EyeQ6, we
> obtain all relevant information related to CM dynamically without
> needing this compatible string.
> 
> > The programming interfaces and so on remains unchanged.
> 
> Even without a compatible string, we are able to utilize the CM. At
> present, there is no node in the device tree, and apart from the
> hardware being faulty, we do not need it.
> 
> >
> > Also other firmware components like U-Boot doesn’t need to be aware of
> > eyeq6 variant.
> 
> It's the same for the firmware; they don't need to have "mti, mips-cm"
> information, as they can retrieve all they need dynamically.

so it the current patch version correct ? If yes and nothing else is
outstanding, I'm going to apply the series.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

