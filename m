Return-Path: <linux-mips+bounces-9752-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39503B02A75
	for <lists+linux-mips@lfdr.de>; Sat, 12 Jul 2025 12:40:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 864FE1BC1379
	for <lists+linux-mips@lfdr.de>; Sat, 12 Jul 2025 10:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C4A427511B;
	Sat, 12 Jul 2025 10:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="yv0ZYtfY"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2062E274670
	for <linux-mips@vger.kernel.org>; Sat, 12 Jul 2025 10:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752316812; cv=none; b=afCiCKfTwvFJgoCM/F8nkWJLJgx0wr/rGJ4rdIE0rZTzRDnhpEcSxntW8Q2VgKSf2gg00hHOpIQAgwG1uD/7gJ8dDdnoc+5lL0qlokG1s8kVPATJMl4qiDHwTLT6yBT5+pwsxXp6O84Pv5yYu3q5uYa/4763fCddPStAKgI4Oh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752316812; c=relaxed/simple;
	bh=XZsKN/Tbj775B4v+W6nKZzTEyimEd6fd2fZmGpYuJj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NYwc1E5niX4J+5G5feeyfqSnXNEquYujcYYog0dURTfm2ZxU6St4u8VPG5GUPlbFoiw42hKIquoHUNTIQmrvhF5dxqrSuph14HmoJWn/fHwwE0u5NLk8tAvBh6BJt3gNHGxHQNk8UJXAUzKpmIItFmZUgmjyrqDc4jWiwBEH5hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=yv0ZYtfY; arc=none smtp.client-ip=212.77.101.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 42019 invoked from network); 12 Jul 2025 12:40:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1752316807; bh=qTgJpmSd6LhUXQuIB22IcfoJEWSMVfDYaSNR4+UA678=;
          h=From:To:Cc:Subject;
          b=yv0ZYtfYVIyUtWCPL0JQMBhSr+6rYxg/gu36uJsHkR9DG+bwk4cRSrZ+HM4sRq85R
           oCgJNh/5S5u+D3P2NjBIRNurak3N3BAk6Jfa8zrsVFv+abBriFKs1giWDJHePdnTn8
           awhIFsMi/PKXJqSUusvyXjpptxLNdVQvqlLmdv0dmWScKu80wFw6BwsyzYhid3V9zI
           pxKcDiiBlJHQGVc5Z10eaAuuMAlbd3Z4fzLBHSaSKiDTdeH6+Zk+ngsuyku6PkmItS
           Om36QpxAKISBedjxPiyfqVH+FU0ySxOhUu85Bjeuw4Zllr5EEPt9bG3yNSHvRU6xnN
           tNRKX1G04TYFg==
Received: from 89-64-3-180.dynamic.play.pl (HELO localhost) (stf_xl@wp.pl@[89.64.3.180])
          (envelope-sender <stf_xl@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <krzk@kernel.org>; 12 Jul 2025 12:40:07 +0200
Date: Sat, 12 Jul 2025 12:40:06 +0200
From: Stanislaw Gruszka <stf_xl@wp.pl>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rosen Penev <rosenp@gmail.com>, linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:MIPS" <linux-mips@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCHv3 wireless-next 7/7] dt-bindings: net: wireless: rt2800:
 add
Message-ID: <20250712104006.GA13512@wp.pl>
References: <20250710200820.262295-1-rosenp@gmail.com>
 <20250710200820.262295-8-rosenp@gmail.com>
 <d8b0abb2-1a12-42bf-aafd-4cd1e21babd6@kernel.org>
 <CAKxU2N-c2tHBYWBM+FJGqdSaqzw9u0O8e0G7AVqk6b0QdRnPTw@mail.gmail.com>
 <20250711-invisible-dainty-jackrabbit-acbf8f@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250711-invisible-dainty-jackrabbit-acbf8f@krzk-bin>
X-WP-MailID: c2d83bddf527eb597eb6cc17933b5770
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [EbNB]                               

Hi Krzysztof,

On Fri, Jul 11, 2025 at 09:48:49AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Jul 10, 2025 at 03:40:30PM -0700, Rosen Penev wrote:
> > On Thu, Jul 10, 2025 at 2:40 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >
> > > On 10/07/2025 22:08, Rosen Penev wrote:
> > > > Add device-tree bindings for the RT2800 SOC wifi device found in older
> > > > Ralink/Mediatek devices.
> > > >
> > > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > > ---
> > > >  .../bindings/net/wireless/ralink,rt2800.yaml  | 47 +++++++++++++++++++
> > > >  1 file changed, 47 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml b/Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml
> > > > new file mode 100644
> > > > index 000000000000..8c13b25bd8b4
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml
> > >
> > > Filename should match compatible. You were already changing something
> > > here...
> > hrm? that makes no sense. Various drivers have multiple compatible lines.
> 
> Luckily we do not speak about drivers here. Anyway, follow standard
> review practices, you don't get special rules.

Could you please elaborate what you mean ?

I greped through Documentation/devicetree/bindings/*/*.yaml and plenty
of "compatible:" items do not match the filename. So hard to tell
what rule you are referencing, as it seems it's not really applied.

Regards
Stanislaw

