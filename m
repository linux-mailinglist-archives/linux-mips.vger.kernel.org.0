Return-Path: <linux-mips+bounces-10390-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B14B2D161
	for <lists+linux-mips@lfdr.de>; Wed, 20 Aug 2025 03:26:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 677681BA5836
	for <lists+linux-mips@lfdr.de>; Wed, 20 Aug 2025 01:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E953B2135DD;
	Wed, 20 Aug 2025 01:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="btWcXV4w"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C493C38;
	Wed, 20 Aug 2025 01:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755653202; cv=none; b=K7sL8IEZvcWf1Pu0X8AWh/Uyl+b3kpca6IuggLnlUXBNBYndy5uOZPwRNxP0AJy4seCxRldgS/2pd/AiGOBB4hz1GvFgml3ue1k/OIr3sm0UymKx1FeyPLgITh/zxsURCKrNeKuaMZtsJRgGPAaG/pWeLu4nDKazdTOXWDqEMD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755653202; c=relaxed/simple;
	bh=Gm41ua+tCecjQYsWzxJcFbyZCUuP0m6rVjsAj7MYVNk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GQaInBKxE9mlclgnHw1XoGrDBZWyNARznuTK72DQ9yWhoAnUqHgI+mq5n0PJhUD7jyOcFs6h//PY20h0OXE4GfvI7m9cvcXqR2NnpMOHb1uXhRowj8S57p/l5yTOegNd5+HWXSXGzOigvi6edEimdBB1lWI6eTiwpGb/l9J8RnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=btWcXV4w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D384FC4CEF1;
	Wed, 20 Aug 2025 01:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755653202;
	bh=Gm41ua+tCecjQYsWzxJcFbyZCUuP0m6rVjsAj7MYVNk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=btWcXV4wLASLDnh6i7rslctNy9EdcRW7+NInbgeC3V8gpEgO8/3rb4nAOWs334VYc
	 iQDQ7F//sj7FD8ci4AK/lFAq3pKdL5zU69N9hrwLfKBgVpcF8a7i4253XNcgZA58/r
	 pipaNsQZfKUvOIC7jTd7PL2QsptO7TYlkYZu03s7BSZGl6fem5eVl9D++vTv8hcJII
	 iLpUnJiwA3db1FxP8PiGXmlkRaCuUnvp235nKZqUAkMK8SZo70H9oIxqMs5e96KqxF
	 ZEhDXI/rFl4zAnsbhYLC/51FffwK//X+drCUs3fofKZ40ifP9NJh6ZhFNXFBl4yfY0
	 ylxIjzOQIiVtA==
Date: Tue, 19 Aug 2025 18:26:41 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: tsbogend@alpha.franken.de
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 john@phrozen.org, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 0/2] mips: lantiq: fix ethernet support
Message-ID: <20250819182641.1b7ff210@kernel.org>
In-Reply-To: <20250817131022.3796476-1-olek2@wp.pl>
References: <20250817131022.3796476-1-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 17 Aug 2025 14:49:05 +0200 Aleksander Jan Bajkowski wrote:
> This series fixes broken Ethernet in the upstream danube dts. The
> driver doesn't attach due to missing burst length property. OpenWRT
> has its own dts, which is correct, so the problem has only been
> spotted now. Other dts inconsistencies with bindings have been
> fixed as well.

Hi Thomas, Aleksander tagged these for net, are you okay with us taking
them via the networking tree? Looks like these are half DTS changes.

