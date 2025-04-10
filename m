Return-Path: <linux-mips+bounces-8539-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CE74FA844B5
	for <lists+linux-mips@lfdr.de>; Thu, 10 Apr 2025 15:26:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 930A97A47AB
	for <lists+linux-mips@lfdr.de>; Thu, 10 Apr 2025 13:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FDE4284B47;
	Thu, 10 Apr 2025 13:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TgcHGlsx"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62596757F3;
	Thu, 10 Apr 2025 13:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744291466; cv=none; b=vDbhvJVWt4FwtxggVRA+NBjbO0qcXmwQA7BPNzZNAotpBtmDqctrc7sJPqMjyIwVNmCB3PUBRjzrctTEkiMHtjiH+okGhDGrHGa9lGudmkMBEhGoYn5YWwsGziOX48R/DwheGk9G7lQSUynMrOFHMIrLmmrxcE/I2xwWb5iwiNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744291466; c=relaxed/simple;
	bh=fsAH6LIiImPAPbyKKk7XSOO9VefF0AOCuyKv4uSZq84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ILP6zkqLZ2G7nKySH3JtVKw1iscVbxQBpKo4NGmgdVySICP8JcCTPDzJukmUVROTIh+77YUZiVSCr6d0ej4nbAj5/ayerrc0RjSwBVuneT4OBhA10+zswKPOY8uaOROwGWAEHFAy4ym8Lj04gHh0aUW67TY55YuBulRLFjC7o5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TgcHGlsx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A75C4CEDD;
	Thu, 10 Apr 2025 13:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744291465;
	bh=fsAH6LIiImPAPbyKKk7XSOO9VefF0AOCuyKv4uSZq84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TgcHGlsxHhvm9Z/hP7OrpMcByLEtQRFdUPmJYKIgXZE1WFVTxUxUI3JVIAfK8Ct1S
	 7+eLhDaKGgdxXy5odn/jRF47jtWcHV5jHKmFypoI2H6jVkNntUXlF+Bk2/GqaSQcO5
	 GzhMskBxc0ii8v71srJgGg7NRD1W1WqpgTeIqeMXZvETm6QYcqL50Bi5Df0I1UuYkG
	 UcI7TCGrdQ1tMqLlaYe06N3ZCk+qaTzPzr2SEWfaYaDNk+j+vmxiGiFm0mIseYu7Ha
	 wxzQufLlhlm6REoYg/O8S3PdkeNl/g8GU747RhZdY02hOJLRVS8rldzzioUpqFq7vs
	 AWlfdPvjEsXBA==
Date: Thu, 10 Apr 2025 08:24:24 -0500
From: Rob Herring <robh@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 01/10] dt-bindings: vendor-prefixes: Add EcoNet
Message-ID: <20250410132424.GA3707300-robh@kernel.org>
References: <20250330170306.2584136-1-cjd@cjdns.fr>
 <20250330170306.2584136-2-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250330170306.2584136-2-cjd@cjdns.fr>

On Sun, Mar 30, 2025 at 05:02:57PM +0000, Caleb James DeLisle wrote:
> Add the "econet" vendor prefix for SoC maker
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Applied since there's a user already applied.

Rob


