Return-Path: <linux-mips+bounces-12531-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 569C7CD1EF5
	for <lists+linux-mips@lfdr.de>; Fri, 19 Dec 2025 22:11:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 314FD3042FEC
	for <lists+linux-mips@lfdr.de>; Fri, 19 Dec 2025 21:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 002D2341AC0;
	Fri, 19 Dec 2025 21:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sZDRnS75"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C300634107D;
	Fri, 19 Dec 2025 21:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766178634; cv=none; b=fzzERBFKkM6zbmJUrX22NZVU0b52WvqU0i5D7J9M0rnp6MXAmK6Ach7rtmCQtxwKYX7ipVDhQk2s5nNfJDOOvnx2h2SOe+Dsv6rnyAzQzz2G37ld+ZmG3kTvboHAPuyl2FvE+YTdB72GM5cmN50yItCFgQjf9iLVm5nY/JlptNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766178634; c=relaxed/simple;
	bh=CWsP0o48cOnDM9vwwFpbePvptnJlvaYDWmV9Z9G5YxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nPDZw745F4KDAsUU/fuwlhp7+nObnUBmw5KsTR4jAj/4T8yNSOynOfpW53o6OsvKKx2Yqa8Ll70xlmeh2Zw4VsOseak6YPg74yFA8khJZE5Q8yr7SdTLbiJ0BRQTH2FiRL1skaYHTNPyp8TLx4apEP/dc/moj67urII8fVErqXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sZDRnS75; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EAB9C4CEF1;
	Fri, 19 Dec 2025 21:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766178634;
	bh=CWsP0o48cOnDM9vwwFpbePvptnJlvaYDWmV9Z9G5YxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sZDRnS75xs9haL3HiFftSC+fIcJZW1bb4DxWpBmx916Tcv/K9QAWXHq7Nm9H59wbo
	 EXp200aLN611YPV5G2KrYOHk+zw4t4lCzHo4QQzuYNnLfWEkK4Dhq79V6RdUtZ3xB5
	 cH82pEPRDu08N1NGWR06G1JStOsxhAFz3zoVDG3PT8zQUec3uuVADD7QZrTxcWXsfR
	 yUUD1QcgldlKg2HpCgp+U/mxnYpbusstcOOa2SmYQY0O9dX5sjoyXEbCjUihO0HP34
	 XKpNDaekfHKUPdbLiwaj93QMvtAb7JrujSHgMvBo1AXL01mTBtEoPR5JN1JGO/o6k4
	 iR1EXlZy0jnUQ==
Date: Fri, 19 Dec 2025 15:10:32 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-clk@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
	linux-gpio@vger.kernel.org, linux-mips@vger.kernel.org,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH 01/13] dt-bindings: mips: Add Mobileye EyeQ6Lplus SoC
Message-ID: <176617863184.3942408.11623781983608873064.robh@kernel.org>
References: <20251217-eyeq6lplus-v1-0-e9cdbd3af4c2@bootlin.com>
 <20251217-eyeq6lplus-v1-1-e9cdbd3af4c2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251217-eyeq6lplus-v1-1-e9cdbd3af4c2@bootlin.com>


On Wed, 17 Dec 2025 14:35:51 +0100, Benoît Monin wrote:
> Add an entry to the mobileye bindings for the EyeQ6Lplus
> which is part of the EyeQ family of system-on-chip.
> 
> Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mips/mobileye.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


