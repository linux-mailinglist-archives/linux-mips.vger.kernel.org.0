Return-Path: <linux-mips+bounces-5520-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D9E974446
	for <lists+linux-mips@lfdr.de>; Tue, 10 Sep 2024 22:48:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20A341C24F98
	for <lists+linux-mips@lfdr.de>; Tue, 10 Sep 2024 20:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 758C01A706B;
	Tue, 10 Sep 2024 20:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="V80WHTY1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EUSSzi1l"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh6-smtp.messagingengine.com (fhigh6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCD117622D;
	Tue, 10 Sep 2024 20:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726001315; cv=none; b=sqxvUcsj1Z9wL2pJnQPvEFCBKyculTSgzO3zxLrR7k4KyrNRlIMgg4p13XgB1EK+8EiLCody+nY55iDSm8SyPXPehsT5rJ7gJdZ0cWvjcC5a7dqGOtf4EHcCcd0sdLNbRQ2yDp/UBlppX2YeuVJggipcuWTLY6kHB9RsCMRWCrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726001315; c=relaxed/simple;
	bh=20i2BlGHksN1/Dhy94tEpQoj1jiq9Zdq3Zo3/6OVMJY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=W6sdmazOqGGQO7timiAmc7Qk9wc+WPrY0emwMhAGIrs6WmoVxrJvi+w/gzz0uZnKjaskXMy3kLkI+LjHfxAJ1aQ+zTjGMPVzMC//WYjr6COB77MJZSTR67OaGMz4vVVB8JhUAW21ydhTQTn6LgpddDOhoJQIFr4vvOSiUlUQNNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=V80WHTY1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EUSSzi1l; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A4C4C114019D;
	Tue, 10 Sep 2024 16:48:30 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-09.internal (MEProxy); Tue, 10 Sep 2024 16:48:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1726001310;
	 x=1726087710; bh=YaNm0bZcNn4debMmAvI7bJ5MdsYn7nFEWpGpIsKSWOY=; b=
	V80WHTY1EEo9pCOyEgYS0nsGJoaGDcqivPbyEQUYpQhH6VF1C6eQXgAzS6F+8ucT
	TiWNuB9ZOtVGtmrhC9xVY5okEsxH7Hnsz0M+02wScoVQa2ymFYlDg+/edHZD1bpi
	IYZqH0Ql+WIzK25EQdxTzmfRfcnelIGUKV5zTtU4vLlrm4Q4Gc9p5jt7jlsw3lPv
	XSgnZZSy7fyay+UXd2rOwF2XR2/avwL3GDtwxoToK31bDCmYGwPeqYEBsDT8MWh1
	VolPA8Xm5cHkIgJRfOTqfQ0YkSmS31GYXjBgVHYAZy0m8chOvJ9GHjx1q+GQUWYX
	aJV6ecV9WMqYLK/v2PH3NQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1726001310; x=
	1726087710; bh=YaNm0bZcNn4debMmAvI7bJ5MdsYn7nFEWpGpIsKSWOY=; b=E
	USSzi1l7A/SnNU+Slls4Lx0kPYBNndr7+QPk0GNxCXKPahNj4mhy28Gmqc5kTGpN
	aenRe9Grf7OyegmCWKi474y/VjWnAUrjeN7lgIotfU7lFai5nQbmF7i/SGtpGVx8
	tt9zG5MofpQ+ces1nShSXqy5VZx0mbx/VVQQLBt9/ISUNztynlh/fqoM9toReyXn
	fVyNWjXHRUP3MqNLXbKKsrERuKucRakRU63n55YQSJweuhYM1+8pQ8qHG0ew1IIj
	wp+6A1cmMf6/qXQjX/A1r1L+Rd+sWYahJJNo9+U1OmaLaJcl4R6s9E4EQwsBiOGP
	IrXSTd2DUuYXM0LGS/Yzg==
X-ME-Sender: <xms:nrDgZkquvb0yXsuQ6EXxIE-1LxXk6ByZG9uEoT3re5CJf3EAwsYs_g>
    <xme:nrDgZqrNh1Q8HeVDe23HwKa0MHfOmPvTqOSu4qdvBaN2IFm8worWCHEaZ6Cp8NcYH
    GFYfHqV4z3ZCNSqUWI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeiledgudeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdflihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgse
    hflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeejheefuddvtdfggfdvffek
    teehhfelgfdvvedvkeeuffefkeehheegvefhveetjeenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghho
    rghtrdgtohhmpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthht
    ohepfhgrnhgtvghrrdhlrghntggvrhesghhmrghilhdrtghomhdprhgtphhtthhopehprg
    hulhgsuhhrthhonheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhr
    vggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrh
    hnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhi
    phhssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:nrDgZpOlsfye0NaTNDzRbr1kyCnwXk0bqmse2lkkAYItWV9v7h8ZVA>
    <xmx:nrDgZr79zJT9-_lgffXagPwkaoRbnIvSWvlG03qVZQ2NjiN0TGXC2g>
    <xmx:nrDgZj6CrHJp_h52tcvdRXKISJm7EtlBxAGbsh9Yl6PU0IoBiGbU8A>
    <xmx:nrDgZrjEhSZBoGZfnS_g-MLQQmkTLjK3a7UrccK1U-w3kAEcYESctw>
    <xmx:nrDgZpRijhTpI9kzV6RbJxtrlrHuNC698S4Tdfv28edUqQd9nQBubPcN>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 35CED1C20065; Tue, 10 Sep 2024 16:48:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 10 Sep 2024 21:48:10 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Serge Semin" <fancer.lancer@gmail.com>
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "paulburton@kernel.org" <paulburton@kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Message-Id: <b4d57581-bad7-4f6f-8d6f-733f1a5d33ba@app.fastmail.com>
In-Reply-To: 
 <7j6cc5i4z4nwg73fowjz756eblnesglqm72jveygqfxngw26mc@sdy6xxomo3qe>
References: <20240612-cm_probe-v2-0-a5b55440563c@flygoat.com>
 <20240612-cm_probe-v2-6-a5b55440563c@flygoat.com>
 <ekvyyq3vzdbyi5suf4irfixyprvtko7rpkffwpc267kiex4ex2@lpu3ctysuviw>
 <79acb1b1-9c1c-4a58-91a5-5dbb286717ec@app.fastmail.com>
 <7j6cc5i4z4nwg73fowjz756eblnesglqm72jveygqfxngw26mc@sdy6xxomo3qe>
Subject: Re: [PATCH v2 6/6] MIPS: cm: Probe GCR address from DeviceTree
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B49=E6=9C=8810=E6=97=A5=E4=B9=9D=E6=9C=88 =E4=B8=8B=E5=
=8D=889:07=EF=BC=8CSerge Semin=E5=86=99=E9=81=93=EF=BC=9A
[...]
> Both MIPS P5600 and P6600 databooks define the GCR_BASE field as
> optionally R/W:
>
> GCR_BASE 31:15 This field sets the base address of the 32KB          R=
 or R/W
>                GCR block of the P5600 MPS.                           (=
IP Config-
>                This register has a fixed value after reset if         =
uration)
>                configured as Read-Only (an IP Configuration Option).
>

Thanks for the pointer, I traced code history and it seems like MIPS dec=
ided
to not expose this functionality at some point, but documents were not u=
pdated.

Maybe I should add a read back check here.

Thanks
--=20
- Jiaxun

