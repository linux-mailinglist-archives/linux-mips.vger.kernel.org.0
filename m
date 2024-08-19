Return-Path: <linux-mips+bounces-4948-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F899564C2
	for <lists+linux-mips@lfdr.de>; Mon, 19 Aug 2024 09:35:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 327A31F2160B
	for <lists+linux-mips@lfdr.de>; Mon, 19 Aug 2024 07:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B31A3157472;
	Mon, 19 Aug 2024 07:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="iYG2qi9N"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A2214AD3D
	for <linux-mips@vger.kernel.org>; Mon, 19 Aug 2024 07:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724052948; cv=none; b=tBhnpb0Whr/0WNY9toPCqyqafaioA2cyFhAubLM8m7evlGDZuO9csBkn9jg3X+ijJZ71fghMiRGeN3Ncj2yf0zR3KS4/l6tAbM1L+yMtP6/0Wjw17kB+LzpsK6P52sysrU/WtidrU47BH8BB9be5AkOp67xcdUb4e6Z4kRadJDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724052948; c=relaxed/simple;
	bh=spq6B6sb/ZIFGYSOPazEWb0knQr9sjtzp6ILO0qVbpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A85EOX02iVsDd7ropAlijNFPPckwgHO5CQJRwvwBocLNLcLUvO+0VTOlIois6poPdiYNn8hT3+V9GW4+ETEgzHtsrSugnOFwnvybHBZsv57pcrZvXWLVKgBfsb6jfYo9pP96CWCODspMiOeCMRzxthDNjChFs7q5R1Ozjzv0l04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=iYG2qi9N; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a7a94478a4eso873683066b.1
        for <linux-mips@vger.kernel.org>; Mon, 19 Aug 2024 00:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1724052945; x=1724657745; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8NyA3r+0SEkxLBULpRBSrNH9reIkd05NfXfPtxwYdwY=;
        b=iYG2qi9N+XFV32ngjlPE6AfO67zxKYdoqJX7bo5UPvTH+dmQ0HH1u/XAIPvJ4Y7jPc
         taMHmqmvaswoQD416pv2cTVRCaQk7qHWK8f6lByr+SrT9h3HiKojnyTF1FDbS+SHqu4y
         gjHfw4md/kZDnEauNzOyqp8mL2MtQDGVoPBin9E997GVYnACYsvJAtJtgA1cZoOyOsVr
         bV3B00fYS1DmIHF6BhLA4e3rjx5rnMfuV1ZFgTLKivEgahS3SW5nNQZZEXJl27wBcmzk
         ArnSbicerKyq0/qfldlIUIjzW16bJCGbOb7W4nuPlQfh6DFL9mDys0pd693Lf0gjlKyE
         CBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724052945; x=1724657745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NyA3r+0SEkxLBULpRBSrNH9reIkd05NfXfPtxwYdwY=;
        b=da6/C71KCXZJFHKlQaBJDcgLz/SEVsTaiqiznHCB6dMDuhlUwub4f5qQGdZXd1ZZDD
         qMkfS9mBXy1wzqrQBgHmTN35xmm9Mws0gE5B/FrGyAdk7qRx7xr9mrEV2KtUBhSr/FE9
         1EPyHpROrrxMkdxr/Yarst7FissPXaB+Fr3e8cY69RgBpMPcM8db1fs1Ls48BFjSaFgt
         fTdBNnAhuHJKLl0uXNd77gbNm1Bn17ecxZTZY8+VNWFQE48rSqgK58Tk5y1ofjmpLMLL
         FAOMaDuvQJ5zGlYkwLTRlhzpsAdymSzg66FiPpp+rg2SpEeC9EN2LvEOW8sis2E4btzO
         UCpA==
X-Forwarded-Encrypted: i=1; AJvYcCX5/rJ6Cq3skxr1DkrHHu7Lc1k06Z8XW/fegKAxhPAd+8AJ29U0xY7ujVm4KP4BpLhw6ZLewEWSONX1obIenqMsY+AsiMFslpuOHQ==
X-Gm-Message-State: AOJu0Yx2eVZP7W1JMoA6eKK2LLYhIifM+w0v0CXOcAAsRQom280d7pd3
	5AO6Whjw5jsYGei07gQmWJ6+CSUceerlNEpmgJPMKoGYrIESf/O0sF+5BU7AX70=
X-Google-Smtp-Source: AGHT+IFGNW4Rp1MF9pErnW5tAeVHGUBzNbSFgBGlimGRBnHwWDOlPps9HXt2/6wAXUpzwZnZvX8mQw==
X-Received: by 2002:a17:907:6d2a:b0:a72:5967:b34 with SMTP id a640c23a62f3a-a8394f7e0b9mr963569066b.22.1724052944878;
        Mon, 19 Aug 2024 00:35:44 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838c6c07sm603195566b.43.2024.08.19.00.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 00:35:44 -0700 (PDT)
Date: Mon, 19 Aug 2024 09:35:43 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, maz@kernel.org, mark.rutland@arm.com, saravanak@google.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v3] of/irq: Support #msi-cells=<0> in of_msi_get_domain
Message-ID: <20240819-3fd4ff3cfa1d216a1241f5a0@orel>
References: <20240817074107.31153-2-ajones@ventanamicro.com>
 <20240818161816.GA173148-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240818161816.GA173148-robh@kernel.org>

On Sun, Aug 18, 2024 at 10:18:16AM GMT, Rob Herring wrote:
> On Sat, Aug 17, 2024 at 09:41:08AM +0200, Andrew Jones wrote:
...
> > +	of_for_each_phandle(&it, err, np, "msi-parent", "#msi-cells", 0) {
> > +		d = irq_find_matching_host(it.node, token);
> > +		if (d)
> > +			return d;
> > +		of_node_put(it.node);
> 
> Pretty sure the iterator does this for you. I can fixup when applying.

Doh, I managed to mess up my usage of OF APIs twice. Thanks for applying
the fixup.

> 
> I plan to tag for stable too.

Good idea.

Thanks,
drew

