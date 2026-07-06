Return-Path: <linux-mips+bounces-15560-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uBjuKCoJTGqgfAEAu9opvQ
	(envelope-from <linux-mips+bounces-15560-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 06 Jul 2026 21:59:38 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 153F971536E
	for <lists+linux-mips@lfdr.de>; Mon, 06 Jul 2026 21:59:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=IM51lUKA;
	dkim=pass header.d=redhat.com header.s=google header.b=ludN8PLQ;
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15560-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15560-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 230B9302F410
	for <lists+linux-mips@lfdr.de>; Mon,  6 Jul 2026 19:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A951C3D7D75;
	Mon,  6 Jul 2026 19:59:15 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8932F3D4112
	for <linux-mips@vger.kernel.org>; Mon,  6 Jul 2026 19:59:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783367955; cv=none; b=ceSpldkB+G/lwruv3LRODTLcuC6ep9HJRrf0p/kVUyPsRpOwsTfNZ9Rza/DGmOTyJvhInAfI9SBDPAS77rxZtNNowXhvalSA3GwqMwQEv8pm8cpPE48jD20GDI555CRwjiId2my+60cBOAkozl75TZWiWtz/BoOf6tIK2+qA6jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783367955; c=relaxed/simple;
	bh=9HWeIwTTx2EQ/+4qhn4IVPVNueno6718Zzeh+X7aaog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rVzh3R5sdNngDMA0GKlThE7uq1CSaotP84VFnCM09EH4tAtdrcnaU/UDj6NWt5XSS3hMrgSc1rfQQvUsBgrTqjJGFrX+9kNzB78H3SQwxoou1Zy3S8zhzKSe9LLakefqq+LuK9SyyknsOTp6nvf4raTT99Yj60tD+mpuoZCT5ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IM51lUKA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ludN8PLQ; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783367952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=miOaW9hoFfDuFPnXiu262F/4yDf/EKYiy2TifipKj0Q=;
	b=IM51lUKA6PTu4fx22pgclurwOHkSYwyrSI4UbZfVCo1IDE7vD4uft8/1ha9F1GioIXDLpW
	2s153wIXQXGcgxnlCOSGWKkcHzCzIe7gseoT2cgaVa06tJpMgQDEWtpRu3MPI7kokTR1nu
	GugB6RiGDIdeeENfZZb8Qt37+mOTNX0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-BH3qsxZRMmyAy97swaPTKA-1; Mon, 06 Jul 2026 15:59:11 -0400
X-MC-Unique: BH3qsxZRMmyAy97swaPTKA-1
X-Mimecast-MFC-AGG-ID: BH3qsxZRMmyAy97swaPTKA_1783367950
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8e9489f62bfso10477506d6.2
        for <linux-mips@vger.kernel.org>; Mon, 06 Jul 2026 12:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783367950; x=1783972750; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miOaW9hoFfDuFPnXiu262F/4yDf/EKYiy2TifipKj0Q=;
        b=ludN8PLQ+BJ6uHL1m9W8Wj//DhmjPDjwZiuzo999ZByjOZ/LSePw0lw0OPl48BUIZh
         hdgHQfkDv/WjHikD4HNd9PPLeKQX0PFf93p/JJ6Fw2CbxLghMndUoAyD1NGrn3aXOB8a
         nYpFsIgERFEIknVEpU2iX3VmmzEQxEoF6RFmmodUSRODN2ZJ8+5UCgZPziF+PtqQ6srd
         tKN+N7Mh09R0upoDxl27tLUGR4ELEkgs2ykLSQFX1NkNW/ABuv5W8Fne/Cr7cpcBJMcQ
         nhHbseDPiG3QGHIrvq0VW7jNs7vA3J8dLQx9aQ4qnbd4knvlgWzBSIKjUtLrVBwbtY7x
         GEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783367950; x=1783972750;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=miOaW9hoFfDuFPnXiu262F/4yDf/EKYiy2TifipKj0Q=;
        b=jvkc3Rxw+LNL4UiCscai8CsQUL5RUEZS61/0X73rbtAsjzafRqFT1Nk9j+99BgtXCJ
         kaDMMxI54pS6gyZqE8WQwoQeIXbrnP/Z5MGJSoWVr1H+LMZAgr4PE3OBNtJy4U+i4iI/
         43OkhhPc+FqFgm9Sfi4Fj9NplPV165bLPnvq4Ts4vDXLEBA6xAY2gcY2J6XJjBcAbBpN
         ygilkXdjIrc627LlxrLucdxxa0xxYXHIrvroODTu0p270UyF3KB5da1jpNwAwjbDew/y
         MHXUGgL3zw+lmkPrWe74CXB38icwLwZjhxBxWGUDyTheLekAytRuKOUnnfy8CfWEKC3B
         vyUQ==
X-Forwarded-Encrypted: i=1; AHgh+RpLbbD3E7JDt/QDwN1jNjpyTAb9s7SAnfVrZJcFBQq+UFsveSCd9PbXqAmdSOEN28fD7LPOeSISRT4g@vger.kernel.org
X-Gm-Message-State: AOJu0YwmFcVHRhlI2im39voev985E59H9R3bCp8K2eZ5YF323j2V1E4M
	m3gV4H+Fubls5Fg5Byu4KyFsS/DNyrNZ/lS8DWzNDqhi/bO5/OXVnoXRdd2koqn86hC33PC0rxj
	4nByDnRwNmSq6nGu9HayZ77T/OGQqF4bGAbvxlfvq6H0WWSqxxFmnR7ZmAcCGtEE=
X-Gm-Gg: AfdE7cn3VCYkEDGJ3c8jsFajAowj5mFThxXuq/43becSnuBAoG0MHC/sx595fgUBpTx
	k4eS+/CVl1ByVrc1/CH2/xYHQ6u4M9bYPlGQP2xOeSLb+ndHKkp+Qru/Btsbp25Fp/jZb6Getmp
	qZXv9r+Y16g/PHJj/i7o6eazr9hrnxMphCa/5QegeO2gWcPTHC8CUXeY0vOv51GcVBrSR3BUn+J
	wCTY1kooVOzJm9ZhjMfIm23a4OPb25Fih6Gyc68/rczCzAus1LDxfbQBj/zjEo4X7vDuOGDr5eb
	2vi2pWpwzvIyfoRtiJjY1Iq5pKjsyIDUROf897xlNS6EcDNR24n8uAtWOMJ821hCLeWdM5qQK40
	xLViN+CHv2c80ohEywi+sTOWIIuUJAdfhfKeb9VeDjl00Dw==
X-Received: by 2002:a05:6214:2605:b0:8eb:70e0:47d0 with SMTP id 6a1803df08f44-8fcb4c006ddmr26668726d6.37.1783367950108;
        Mon, 06 Jul 2026 12:59:10 -0700 (PDT)
X-Received: by 2002:a05:6214:2605:b0:8eb:70e0:47d0 with SMTP id 6a1803df08f44-8fcb4c006ddmr26668246d6.37.1783367949576;
        Mon, 06 Jul 2026 12:59:09 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f46f013f05sm143092136d6.16.2026.07.06.12.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:59:08 -0700 (PDT)
Date: Mon, 6 Jul 2026 15:59:06 -0400
From: Brian Masney <bmasney@redhat.com>
To: WenTao Liang <vulab@iscas.ac.cn>
Cc: paul@crapouillou.net, mturquette@baylibre.com, sboyd@kernel.org,
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] clk/ingenic: fix clock leak on clk_register_clkdev
 failure
Message-ID: <akwJCq9uUY3rzFxe@redhat.com>
References: <20260628122811.44799-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628122811.44799-1-vulab@iscas.ac.cn>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-15560-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bmasney@redhat.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vulab@iscas.ac.cn,m:paul@crapouillou.net,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux-mips@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gregkh@linuxfoundation.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxfoundation.org:email,iscas.ac.cn:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 153F971536E

On Sun, Jun 28, 2026 at 08:28:11PM +0800, WenTao Liang wrote:
> clk_register() succeeds but clk_register_clkdev() fails, and the error
> path jumps to out without calling clk_unregister or clk_put to release
> the registered clock. This leaks the clock object within the common clock
> framework


> , contrasting with the CGU_CLK_EXT type path which correctly
> calls clk_put on error.

I would drop this part. Just focus on what you are fixing.

> 
> Suggested-by: Greg KH <gregkh@linuxfoundation.org>

I don't see where on the v1 Greg suggested this, unless I am missing
something?

> Fixes: b066303fb3e7 ("clk: ingenic: add driver for Ingenic SoC CGU clocks")
> Cc: stable@vger.kernel.org
> Signed-off-by: WenTao Liang <vulab@iscas.ac.cn>
> ---
> Changes in v2:
> - Fix patch format based on reviewer feedback

Link to v1: https://lore.kernel.org/linux-clk/20260626115644.33779-1-vulab@iscas.ac.cn/

With those fixes:

Reviewed-by: Brian Masney <bmasney@redhat.com>


> ---
>  drivers/clk/ingenic/cgu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
> index 41e4c69131bd..b59b24d0e3cf 100644
> --- a/drivers/clk/ingenic/cgu.c
> +++ b/drivers/clk/ingenic/cgu.c
> @@ -774,8 +774,10 @@ static int ingenic_register_clock(struct ingenic_cgu *cgu, unsigned idx)
>  	}
>  
>  	err = clk_register_clkdev(clk, clk_info->name, NULL);
> -	if (err)
> +	if (err) {
> +		clk_unregister(clk);
>  		goto out;
> +	}
>  
>  	cgu->clocks.clks[idx] = clk;
>  out:
> -- 
> 2.39.5 (Apple Git-154)
> 


