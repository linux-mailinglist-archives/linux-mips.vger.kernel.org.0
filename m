Return-Path: <linux-mips+bounces-14142-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FrOOQ0q3mmSoQkAu9opvQ
	(envelope-from <linux-mips+bounces-14142-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 14 Apr 2026 13:50:37 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EA13F99A5
	for <lists+linux-mips@lfdr.de>; Tue, 14 Apr 2026 13:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E792D304D5E3
	for <lists+linux-mips@lfdr.de>; Tue, 14 Apr 2026 11:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 083053DDDB1;
	Tue, 14 Apr 2026 11:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URejJB3K"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DEA42AA9
	for <linux-mips@vger.kernel.org>; Tue, 14 Apr 2026 11:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776167381; cv=pass; b=OjZDm62stYt8Ahl5RC56HI85VQlZQkaWVAn4y58ZDhHsbGk2eHMNzOaEHFpSXIS3Tf4OBuQOpEf6Q7xBxBQeafiEtGlogZUiJJeTdU6rR83AiVxNe+irG/Vcd6QZZBfaJlNIHLKJaGAaYGC6XzuCXVhruqOmbpgi9CdgZvRHIrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776167381; c=relaxed/simple;
	bh=Ufv4J6baPU2WSi/6wgzJOqGGMtNG672dGk0L3nk8cPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oxd2sAmuLB0mE2OgEtX28kTENj7KPIQ0GEkGzj/RaBdjzSsoLYHDNTNQcnOXqIM2XKuZTYdWsFspKIBJbkKzY07IMwCH0R6KRPxYSFCo0AUQKkqYPrZ+X9T9zgLnW0VAhQRJXGzdvfECoAoDErKZ9ptkLvNaY/DAJimEpXf2INs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URejJB3K; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-651c8371ed5so1209593d50.2
        for <linux-mips@vger.kernel.org>; Tue, 14 Apr 2026 04:49:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776167380; cv=none;
        d=google.com; s=arc-20240605;
        b=KiyUsWl94BCy5SZzfi1Q4TDqkoMK8SV2NLSD7i1YjTCjzFjgt4+63c6X9Dq6o8QCaO
         MsLOFNY2WMd2Q67Hz10pPt7rdf2ZDaiqk7Uo6ZPgGJXDhA/2Wa67nBUw9U0tZWL16kL3
         Z8KpPbGL/F9eRUL2Uzdug54fgcFn//PqHE5Cvlx4n/gTJlrvGNd5TrXUJOx6Ba0/hdJQ
         N461NEH8quU/XACf2RZd5n5f9dr6cAeUCplgH7xx3rryPK7aQk0VFmTHL+7dMFBiX2UU
         kbd6giVYQBW+msgor4xa+gaqnTOaRqEKaSizicO6Br8IkF/qd4VLqWfy8DNiqC8tHPYl
         gkfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HiDQJibsW8Dy2yLg815wN14aFJJg7FhsN8DrnEwbqfQ=;
        fh=9q4pBHmKqRuhkw8aJiHPMHO6kXoPvgoFDSdr/faOPw4=;
        b=POm8xbaU2z57iSqfw/g7BQ/NxVkxAjgb5D7AkkEGDSu4o/qv5f0ZocqVXmuJi5a/MV
         nezLFPgsUCBgUxlHjwCAzXF01v6lv1tNDpc8iY+dBJKoqjhNA2N9j8vqvvLiYBerNIjH
         x1m2+cL+sNIo8JV2UGZYsdrZ6fAiUYzZsEoN8lIL2+ekWc5UrbzI1HyuHjnfJiDeNi2u
         /RcTPxFHSuDqyhDzxCqLCAq4/MZuYkRmvtTjwcaG0O4uWrzfe6oEx0SrQs0fVCEbrOEx
         ZlXmvXYGGCTC3hoM444wttXHk13CDGuH8U9w+FDVEaGVOY2CqC81n38X1Aj1+Ywp7NQ7
         WIeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776167380; x=1776772180; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HiDQJibsW8Dy2yLg815wN14aFJJg7FhsN8DrnEwbqfQ=;
        b=URejJB3KMDS8eGFvlvpxhNXW3QoWDlX/5lhYSui6BdQxQoOi/imB9QpwVpMUK5XJ2q
         pyJMDP1AwRbZc6+dO1yrrKtCpsO3ybftnZMw+5hHNX0Jhh7M54nGq8ZiwnpR/MzbtRhR
         fZhZHGZzpSnpLhvBp9YWmAOHqRwiyhoXYxnsU+rRmBF7wotHxbb8XJnzu4iRWpZFDsv3
         P++dFwmXobx5MdArAgHOSW/J2KSyr89uYTxHiuf1ewJKBAxBSLWxKXLOz5OHk1tZ3Rgs
         2FY0ym9LO32IDmfUN139hggs36w4u8pBUePz+6c8cO65zKoCjvdO8nEqkx/xUO4snRk1
         gHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776167380; x=1776772180;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HiDQJibsW8Dy2yLg815wN14aFJJg7FhsN8DrnEwbqfQ=;
        b=kf3sQGptsLhTGZMZhm8snERW55NPF6VmGsrEIUvWpAoBhadYaj89uhrnNZE8dxNVbo
         yoEp+AD/JX3REw2Ej3d//9XwqfvxX2fA3vo6gnw9Ejeu/3jWMH0GX4TlbSqc+ktM6QXz
         BR3G6Ko6Vzf/V+Tw4pPeY2Yqj0pIJZi2zDQJoLATvdrIRyUV0pJh039oQ3kGcxI6CkYf
         iLxJ+wHBEvO/4mYGdLS1mLvjriBPlRk0rK5YAfhZgu5FqdyO2KjzpGawzeJlgu5g74Rq
         yuUNQeIQ7EYcJahZfoHEZEUsRiJ6Mdzh9mjXZHftxa/lXO1K+khK6/vUfyEyWu3IQcNO
         G3Ew==
X-Forwarded-Encrypted: i=1; AFNElJ8M7oVeYZVuTVOpTIFQMrRSb0Gu7lVcX/PQiNLYUVuy3On84BPfSUE/P2fuIuh1tVWIk+3vwSBmxbka@vger.kernel.org
X-Gm-Message-State: AOJu0YzhBXWPkvGAE7H008GO1tbUra7xBXC9Li10EZL3binCC5YxnflV
	QNLuo6fnWgr+H2tPdxerjywtOVcF/efhVumhDZwUq3oxugqAAgPcu7/yLVPJOQqEyx3HCkEQnbI
	2KsfWYpH3Lbu704hxS488IFmZ5FyMxJw=
X-Gm-Gg: AeBDietYqzLScV0hdEdIEIsSN4at80IrY0u1x/rApADpMsOL4l2KiKJhvkoV7pcWgRW
	ZiUOut8A3Yg6dsZe6aEGA0lgO73l5aNqRUg4j1EXvNiEpdtcXI/nhrzLhNevKhyADVWsbVxUjEc
	UVlyKwLS3yIq7fu9OG+GfuUkTOAlq4KXPJaxo8PpabRt3/OBmJSLRHlc4NANKOO9JFTKsa5pU7P
	1DInxbfllON7o+5ffj+IMdl3ryLy18gf8uSzdpLBksJEgLZew9VpEZuu9nkf+3qL0lq/Z1aPO3G
	5eTR3Gmxyg==
X-Received: by 2002:a05:690e:1511:b0:651:cf23:6612 with SMTP id
 956f58d0204a3-651cf23695cmr5327604d50.34.1776167379766; Tue, 14 Apr 2026
 04:49:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260412124247.2494971-1-lgs201920130244@gmail.com> <ad0c8y1u5zAhheJX@redhat.com>
In-Reply-To: <ad0c8y1u5zAhheJX@redhat.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 14 Apr 2026 19:49:31 +0800
X-Gm-Features: AQROBzAHa2QmuGgpHDSe-Y4PCign0qhbR1MGtTMMAaOeS4o008iXPrSOjj65ZYk
Message-ID: <CANUHTR-9HYnCuavM9O_wcVg3VuDyV4zQH4P9jYhViBj_PbYV9A@mail.gmail.com>
Subject: Re: [PATCH v2] clk: eyeq: fix memory leak in eqc_auxdev_create()
 error path
To: Brian Masney <bmasney@redhat.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-14142-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 44EA13F99A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Brian,

Thanks for reviewing.

On Tue, 14 Apr 2026 at 00:42, Brian Masney <bmasney@redhat.com> wrote:
>
> There is a leak in the error path here as well. I think this code
> should be converted to devm_kzalloc().
>
> There is no devm_kzalloc_obj() yet, however according to [1] that should
> be coming soon.
>
> [1] https://lore.kernel.org/lkml/20260330154108.GA3389518@killaraus.ideasonboard.com/
>
> Brian
>

I may be missing something, but I think the auxiliary_device_add() error
path is already handled here:

ret = auxiliary_device_add(adev);
if (ret)
        auxiliary_device_uninit(adev);

The auxiliary device also has:

adev->dev.release = eqc_auxdev_release;

with:

static void eqc_auxdev_release(struct device *dev)
{
        struct auxiliary_device *adev = to_auxiliary_dev(dev);

        kfree(adev);
}

So my understanding was that after a successful auxiliary_device_init(),
the auxiliary_device_add() failure path should be cleaned up through
auxiliary_device_uninit(), which would eventually invoke the release
callback and free adev.

The leak I was trying to fix is only the auxiliary_device_init() failure
path, where the function returns directly before that cleanup path is
available.

Please let me know if I overlooked something.

Thanks,
Guangshuo

