Return-Path: <linux-mips+bounces-14189-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Tz6gGG894mmB3wAAu9opvQ
	(envelope-from <linux-mips+bounces-14189-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2026 16:02:23 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C62541BD68
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2026 16:02:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8935300BCB0
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2026 14:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD82286D4D;
	Fri, 17 Apr 2026 14:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUv47AHU"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152A127E1DC
	for <linux-mips@vger.kernel.org>; Fri, 17 Apr 2026 14:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776434540; cv=none; b=XZpLR1jBEhT/lekivVC0CkBhe9fQTfqNs5seRwe3zB6AC/shxNrUSAndYDgTfOH2hQPBQ/DsfUuw+uLOcHsFy1aLaX6cQy6wCAFEaBfe5MOK903/chgAFKoKot3BX1w499pPuTSLffuM2LAZkDbXyi+SbfK8dzccD03mAH3fMCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776434540; c=relaxed/simple;
	bh=dZ9GD/Olh90uG0JI2WwMZDNp/4JluJw1R4f5usRRnXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dOR6gDZH92+57F9d07gD8fc0PEKD+rxBbf+Ofsw+zln5JuufIIcfD/VqL8dYlOIMefsbKv/nmY3hou5ax89/TPZ6KFY8esQbPggw6DLOC3fxRIygnCIOIHuIX2qb+8OsBwLMNM7MGdvLA1yPF05zGBU0WaXX8wCx7YgrVBRPK2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YUv47AHU; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488d2079582so7952555e9.2
        for <linux-mips@vger.kernel.org>; Fri, 17 Apr 2026 07:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776434537; x=1777039337; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u1g+4ReXpg8o/Hja17dXPjGo07lyXXK1KMLo4Txko/I=;
        b=YUv47AHUEtAz5zSLR7rbqLjH2eo2syTfnCHikapvqcQna1xAHvfb9eL7aY+XpWWsRt
         WzmmHCpIC7ZwNtyusz+JlcGwr1r6GjaxbDyM/sIX+NTQLkqRFUQfRNvOm440Sis/h+1t
         9zE25MLDeSkcsR6h8LXYe3RfJ3esywn4ZtoS6mv4gy/E2MgvS95qRN+/BEoHd4q8ZO2m
         PfF9rwtSt4sYc8U2VXKxOabDgr0xGhqEEOCh8UO9IKMrb2h2XING6hY59iYxBLWJ4Uqw
         GBK+InDHFDo7tc/7yI6dgVwV8+gZTLMOyg7aqxoRs2A5Zw7WzJcaYDY9+s2v1JgALPb4
         JTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776434537; x=1777039337;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u1g+4ReXpg8o/Hja17dXPjGo07lyXXK1KMLo4Txko/I=;
        b=pDBTCYfAr+MWK/x/IA5/cLMo54Cfo1Gn06mDmr+gc/ivXGz36YOaA4U3tCPt9ujnZH
         Jc1wiVG+U0YgA2wN7rmPqK3+h/6bOE3awCu594dbEVU//+lFewXmdLit7kLJBIYd5zkZ
         khWahnM3bj24abq/YYr+afuX18LVONlD8ZdbDKWujUsf4MSlXHz0hGgt6bujJk7KE9I8
         r+TeM7GFj2EV2OCnuL51sOswmWrsZCfsPY/SpvQ/6oFWrrPKuMpwWtQPNXgr0fAyqzS2
         fh2C9AF/XbVh8qHUwLI280xXCxUhbDTmYdso7X7UolPVp3PNRGRYD6tAQFYVzEsG21Lb
         QKEA==
X-Forwarded-Encrypted: i=1; AFNElJ/6X+8puGRhH5RpyT9oTtjyG1ymWLYf/Yks56ZAZ6nzk3mC05r50N7wg5IZOP48fBWZqhFREp2zgqb3@vger.kernel.org
X-Gm-Message-State: AOJu0YxdYPU8/mCxpKGNOMaADUYGIJMHWHDCTmRaJS5dVSRrglnfXY+B
	8LH73CNnaJm9k+9dfa0WQ9WSv6v7P3NW8ebndxTeqgyfznYhgvvz6QTa
X-Gm-Gg: AeBDiev0l4B9Q+j+E8yS2aQFpwNkTNa1tu9GOig30r1P5fnZGfp6nw8dqR7WbzHqrNj
	wE0iLY8x1z/CxIEm0AO0dnezS1Zjsk1pDp42s/PW5EUWM14lcxGS1/zCG1hcvQjBUtIgyPpX4m7
	tsco3eEYEdgGY7q/A7plrboeJN8D7pkwUoeIqgCqiO6iXc7biIcVaeS3paSrYcfQmUXeDYZ7OX4
	Gh1mgADLQk3+5wyEUrXm1IgvvRhdLKIpjVAkZeMPjzriDUBCzFn6dAgfaE+fZWY9j+pVYKOxAvi
	5nmatTWOxuIwY16LmeVWbVO7ppPfPHza1pDRlWt5e/eEdwdZEIrNCu/xLkcfCNikQcW9u1le01r
	snwbbDC4BkEoIg/DFJ+BTX/Ou+pjwZ2aryXFRG3ki8LZa/ZqrhSIfJa+Hg4g4B6FYOA46vVdRXl
	y2m/ytpKv/N1cW2gvTeSatdJY6Cjtn+w==
X-Received: by 2002:a05:600c:c0db:b0:488:a14d:3d81 with SMTP id 5b1f17b1804b1-488fb73a9a2mr33391295e9.2.1776434537206;
        Fri, 17 Apr 2026 07:02:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1cfbf2sm46780695e9.15.2026.04.17.07.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 07:02:15 -0700 (PDT)
Date: Fri, 17 Apr 2026 17:02:12 +0300
From: Dan Carpenter <error27@gmail.com>
To: Maxwell Doose <m32285159@gmail.com>
Cc: tsbogend@alpha.franken.de, gregkh@linuxfoundation.org,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] mips: cavium-octeon: remove cmd queue state and related
 typedefs
Message-ID: <aeI9ZDPoP0apY92N@stanley.mountain>
References: <20260417023602.112359-1-m32285159@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417023602.112359-1-m32285159@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14189-lists,linux-mips=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9C62541BD68
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 09:36:02PM -0500, Maxwell Doose wrote:
> diff --git a/arch/mips/include/asm/octeon/cvmx-cmd-queue.h b/arch/mips/include/asm/octeon/cvmx-cmd-queue.h
> index 67e1b2162b19..faef98173a4f 100644
> --- a/arch/mips/include/asm/octeon/cvmx-cmd-queue.h
> +++ b/arch/mips/include/asm/octeon/cvmx-cmd-queue.h
> @@ -71,6 +71,12 @@
>   *
>   */
>  
> +/* Global pointer to the state of command the queues
> + * Moved here to satisfy requirements in cvmx-cmd-queue.c for EXPORT_SYMBOL_GPL
> + */
> +extern struct __cvmx_cmd_queue_all_state
> +	    *__cvmx_cmd_queue_state_ptr;
> +

This is arch/mips/ and that's a different tree from staging with
different maintainers.  Generally, the rest of the kernel doesn't like
churn so I probably wouldn't send patches like this one for arch/mips/.

This comment isn't accurate.  This is a Sparse thing and nothing to do
with EXPORT_SYMBOL_GPL.

Normally we would decare variables like this in a header file, sure.
I guess the original authors wanted make absolutely sure no one ever
used this variable so they declared as an extern in
__cvmx_cmd_queue_state_ptr() __cvmx_cmd_queue_get_state().  It's unusual
and paranoid but I can't think of another reason why they would do it.
Generally, outside of staging, you just go along with whatever the
original author wanted.  They did the work after all, so they get to
decide.

This patch removes the declaration in __cvmx_cmd_queue_state_ptr() but
leaves it in __cvmx_cmd_queue_get_state().  We definitely can't do that.
And we can't mix this in with a remove typedefs patch.

regards,
dan carpenter

> @@ -234,10 +240,8 @@ static inline int __cvmx_cmd_queue_get_index(cvmx_cmd_queue_id_t queue_id)
>   * @qptr:     Pointer to the queue's global state
>   */
>  static inline void __cvmx_cmd_queue_lock(cvmx_cmd_queue_id_t queue_id,
> -					 __cvmx_cmd_queue_state_t *qptr)
> +					 struct __cvmx_cmd_queue_state *qptr)
>  {
> -	extern __cvmx_cmd_queue_all_state_t
> -	    *__cvmx_cmd_queue_state_ptr;
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

>  	int tmp;
>  	int my_ticket;
>  	prefetch(qptr);

[ snip]

> @@ -299,10 +303,10 @@ static inline void __cvmx_cmd_queue_unlock(__cvmx_cmd_queue_state_t *qptr)
>   *
>   * Returns Queue structure or NULL on failure
>   */
> -static inline __cvmx_cmd_queue_state_t
> +static inline struct __cvmx_cmd_queue_state
>      *__cvmx_cmd_queue_get_state(cvmx_cmd_queue_id_t queue_id)
>  {
> -	extern __cvmx_cmd_queue_all_state_t
> +	extern struct __cvmx_cmd_queue_all_state
>  	    *__cvmx_cmd_queue_state_ptr;
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

>  	return &__cvmx_cmd_queue_state_ptr->
>  	    state[__cvmx_cmd_queue_get_index(queue_id)];


