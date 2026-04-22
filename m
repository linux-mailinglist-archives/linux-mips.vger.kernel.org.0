Return-Path: <linux-mips+bounces-14233-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOb7LPzO6GklQQIAu9opvQ
	(envelope-from <linux-mips+bounces-14233-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2026 15:37:00 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A741446D0A
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2026 15:37:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71A02306900A
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2026 13:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D002C3E95AB;
	Wed, 22 Apr 2026 13:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKZgeR9T"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500463DB626
	for <linux-mips@vger.kernel.org>; Wed, 22 Apr 2026 13:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776864510; cv=none; b=spnflRfiVyVAAdzXlk3H/Zg6sKaZ2UY0RFnNm1SySjsKYrd/9k/A6BZNNesCMLv8meZXsQlk9N49uqgFe0YcbVt8RSXqQ5hw2BU9vooAjpFGJRi53nTiS1nw0l/spVHLyxRuuw4S1XtYGbseJpwRdhKe5wjU6gooR5UXn+BUQm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776864510; c=relaxed/simple;
	bh=Ls8R0v4nHceKVBL1Grl2e5FhI0eNEP/FpUXARtHXqAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LXnIqZkWpG8d4k47SN9om3P9sL2NGuy5dmGmK9+dNdua96RB1zbfFgiViGMp0oTxYDjjAXV+CZa9VxN3N+Xj7ZnDynMczWBhMGUsPPGh3aH2cq5wUIIFa8nKbIukZbrBU4LgXd3K4WEaFRSzusWQDKL0NnodR1d9Om0TaYbVwAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKZgeR9T; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38e7d984096so59631971fa.2
        for <linux-mips@vger.kernel.org>; Wed, 22 Apr 2026 06:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776864507; x=1777469307; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B7DZdG1ygeQjm+QsijNr56ROnVch8sEGbGnDlhLN7s8=;
        b=TKZgeR9TDzb5bP+sVNbWc0b1a57TnGi1Y9lp5SO7srnudW4GiTBZekRi71vVmeKWZR
         Lc9mA0yWrMu7EgtiwIdknwcaEp2ERarxHnxFwe3QKzcQkt8SVAxN+K2vSZ67j9BgrEpA
         Wt42XH7R2tcOyHzwHL3vTpdkQWVLaS5sFvJAq01Q3ZHCQcbxzoHP+euL5Sad1stAwHKv
         PxH8rEe2NKapAWrkOgkder27nsEKQ/bxVFQ0GT0KJZlrC7eHGqmytHayv7PexA9DWWL1
         nHofASGab1FXsWEoMGWfz9JlCwvo8VGjiOgAYa1DlYJ0oDM0IdjwTHqdaj0MdQ2XNP7Q
         Rurg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776864507; x=1777469307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B7DZdG1ygeQjm+QsijNr56ROnVch8sEGbGnDlhLN7s8=;
        b=jAPRXy8Ge9Q5NSPghozUfaOfjQ3BcMPUL6Zajnyl6T+2ur3PnwUGwMBwuDK0Z1bi5P
         Hfe3ng0T1cAgeBhx2Aa2s98mFNoqmjfH0ZImm/Ba+E83rsvLgGjCu1AXIqB45X3o7ULv
         TaGMk4op4HyCvnZVQLq0azVGVAm5vQYhsKEYATIqRcyX9RHf/0hvBAIB5TJzbENJKikG
         6PWqzeCtVu5Y5g/fX0+2d+9UPOZ8Ngq5Zg5Fb6UyzA21M5CVx/mbJWXwTKSwYzK4RP1S
         j2lqtSlJt37kNeGd+xPOk8VgT2U8vaJMuNEySU1wjxrfcVs8MR9XbSVLp6GgNUSNiZZm
         KBIg==
X-Forwarded-Encrypted: i=1; AFNElJ/Sb/gxsCXl1OxF/YIR/YVRI1rh5yUMbo5BVYCTnA19L4vm0OfTY7Q5kLBgHA0q11VQcSOYsWgdDmro@vger.kernel.org
X-Gm-Message-State: AOJu0YxYZo+iQPlKx8e7aEOyWrgrHkYNXE+I3jzDVbEaOEhEaYZqaU6P
	XesAkzVjpruucwpX1msmcBWFOudwJ7hIRPSYr67MsSUss8QdaWT771ip
X-Gm-Gg: AeBDievr4vZ5JGD7RuzEqEA8hnTTKouT/GCHiotMnDUDgX0/rqKGZ2zymYgh+tgbOr8
	8au1l612X6uHFgNxdNgYulrYGAdfsmk43ah6t4syq/vZgRhSbI2wN8P4QslYCI/b8H2Lljvdse2
	RYjhLPaVmmHpK66pYBpMwtNHVCiakpdx927QvmFrkXrbQrQTKZBGmYSh18jEFopdZzCd3250Z/L
	d5SljHo+l6DHgKxyHO6cFIycavFJ2J+836gTWa9DkrTDwZ/EfV69feS7QAJ7H+QJhVTpflybrN3
	ccx+71wpGb4bJErlSOaDY7cRayYUHdJENIU1ZSsTLxgCR7qfkwpYmgekeR7J2s+fu6fi629F/tF
	CnqEnG+xo7131gOW6aMHtDwZTaDr5l4bX3Czq0ibZe7xF+jyD1E01iNs3hUD4XlyIwjr7ObrJ8d
	cm1ynQMQ3UwxUY80TyPNT2Cqllk7rtcXXG5pEm7VHEUeSmk5woeXoX6dHi5KJpAbIC8kkqae9cW
	h2wOyirCJ9wP9KBIg==
X-Received: by 2002:a2e:be1a:0:b0:38d:e220:8dc2 with SMTP id 38308e7fff4ca-38ec7adb720mr71809041fa.20.1776864507102;
        Wed, 22 Apr 2026 06:28:27 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:727:24c4:8ea5:6d98:549c:1687? ([2a00:1fa0:727:24c4:8ea5:6d98:549c:1687])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb4f5119sm33473551fa.2.2026.04.22.06.28.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 06:28:26 -0700 (PDT)
Message-ID: <e62e3f14-c1fe-45bc-ae9e-760058dfca1d@gmail.com>
Date: Wed, 22 Apr 2026 16:28:24 +0300
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] iio: adc: ingenic-adc: refactor
 ingenic_adc_read_chan_info_raw()
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Felipe Ribeiro de Souza <felipers@ime.usp.br>
Cc: andy@kernel.org, dlechner@baylibre.com, jic23@kernel.org,
 nuno.sa@analog.com, paul@crapouillou.net,
 Lucas Ivars Cadima Ciziks <lucas@ciziks.com>, linux-iio@vger.kernel.org,
 linux-mips@vger.kernel.org
References: <20260421221629.70401-1-felipers@ime.usp.br>
 <20260421221629.70401-2-felipers@ime.usp.br>
 <aeiJo3RCKFLEGLEt@ashevche-desk.local>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <aeiJo3RCKFLEGLEt@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-14233-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sergeishtylyov@gmail.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3A741446D0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/22/26 11:41 AM, Andy Shevchenko wrote:
[...]

>> Extract the sample logic from ingenic_adc_read_chan_info_raw() into
>> a new helper function ingenic_adc_read_chan_locked() to improve code
>> readability and modularity.
>>
>> The helper handles the mutex-protected section for sampling channels,
>> while the main function manages clock enabling/disabling.
> 
> ...
> 
>> +static int ingenic_adc_read_chan_info_raw(struct iio_dev *iio_dev,
>> +					  struct iio_chan_spec const *chan,
>> +					  int *val)
>> +{
>> +	int ret;
>> +	struct ingenic_adc *adc = iio_priv(iio_dev);
> 
> Please, keep it as in reversed xmas tree order.
> 
>> +	ret = clk_enable(adc->clk);
> 
>> +
> 
> Redundant blank line.

   Yep.

> 
>> +	if (ret) {
>> +		dev_err(iio_dev->dev.parent, "Failed to enable clock: %d\n",
>> +			ret);
> 
> Make it a single line. It's fine to go a bit over 80 for readability purposes.

   And BTW the new checkpatch limit is 100 columns. :-)

[...]

MBR, Sergey


