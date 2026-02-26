Return-Path: <linux-mips+bounces-13252-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDI+KV7GoGnImQQAu9opvQ
	(envelope-from <linux-mips+bounces-13252-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 26 Feb 2026 23:17:02 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEAD1B0442
	for <lists+linux-mips@lfdr.de>; Thu, 26 Feb 2026 23:17:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7C2823044312
	for <lists+linux-mips@lfdr.de>; Thu, 26 Feb 2026 22:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF52837B40B;
	Thu, 26 Feb 2026 22:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nxyu5OmB"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375102F28FF
	for <linux-mips@vger.kernel.org>; Thu, 26 Feb 2026 22:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772144208; cv=none; b=T5T9ZzwJa2rht13pW1TD7nV6FyZsTUKW8SNnk5uggdQBwBnCY9vmOmTxWXsDsNzYsOLkuR4ZApuLQXVrxquM6CBs9/bTNffUWix4OI2vlpxvlXgcjH5KXSqifvA9UVoVcA/G3QbwWQeRtLQV6kwoVKpv6n42+56fpIFM2THFQdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772144208; c=relaxed/simple;
	bh=7pISUiriLel5SsyXdZtL3567cqkDtldPIiHVjDv/hik=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Pc78KO199prrHQBYZjvDdnfEH+1INgTBaGQyg92jcoBpyqZfI48HwL/qo7d/d99LdKRWCX0jcN4NgOJyGbZumQ9znjH/bwQiwwfG7EgDL5lThOc4NylIi+VrG6A2o7mGJGPO2Hqc+QpV95DfJAjLYpNqiSm8eexK0ptCR5+SimM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nxyu5OmB; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-506a321cc53so16804161cf.3
        for <linux-mips@vger.kernel.org>; Thu, 26 Feb 2026 14:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772144206; x=1772749006; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pISUiriLel5SsyXdZtL3567cqkDtldPIiHVjDv/hik=;
        b=Nxyu5OmBGcZVCjhf3lfYbZ48v+f74jNtglZWUAPseK11ud98uSZR0N9s0e64jXWWdi
         Hvb0c3pvLao9KKWYMwBj86ZEVNSV0zlhgp+J/JeRJ3cSdOcUuuLUMIllA12bd02sR5Rw
         alKEIe5v7CLi5/6zgBWxL21eR7dMLyiAZ2uIvxgzfjgrItq4c/E178JHkoM3tB7xt29V
         VWDfwWOO98nrdNGZi60R1ktZ73TVLTHWSUdQdE/K4XZNDKptviAMbqBRxX+SbtUSwD1b
         vTqKtjwkwLPpxZBjDbHQ0o1MrP0O7UTYvyNAUCqLQCFY+dTsXzfKjfdyMRKpJdSQTp8U
         92cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772144206; x=1772749006;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7pISUiriLel5SsyXdZtL3567cqkDtldPIiHVjDv/hik=;
        b=Zd9v6D3x8iaqRnWk46hSPadv85XugjnzHchJUU/opg4/05+EuNcbNsdXDsJ6AaRCbN
         1tGWaCzc/XEurKH/lOlD1fyfLjgOwGwlA+bG8ATweKjMufUK1+0W+iEWgiwpho9wg9E1
         acfeCuAEvAzehN04BKwdf4zhOP6Y2nZO0l/gM485hbdD1XbwMeoUIXDLxhNc5d4hkP6X
         0pbXtt0SogO4wW9LsFbcp89kpVN48FEsAIu9X42ZHu9x80eZlwi8WW1kz/P6L6B8LIQ3
         RUTsarOhrdgJ9bpUqlj9Ap6ovZS2EZoQ4tclZRirC7cSGEjuIXn0jh00/o/DJdX5qGDM
         obPA==
X-Gm-Message-State: AOJu0YwDUUHB+J6WF2xzPIN6nR9hQln+qm5UNFPIgF6cjY7pnrpJPFbC
	3fsqT2ltEkZKNwacQR/v44BKirj4DjDvP8PIaBIpK+DLIdBFyVz3wt7895ZAvZ7FiVngxQ==
X-Gm-Gg: ATEYQzw1AgHFpnSx08WXnwQFpeqP5VTVu/Owp6puZUD3xTeCt14LelxMf7waVwU3Lu0
	lb3apHneo/xWAvMyvHz0WsnwS8uFXpo40OccvP+YDbNirljaPmz9X0jztiujmvmjvG/1A1qOKaR
	DR5fs87Sgs6vfqeQYCTSZLMmVFeArVjzdV5LMCKbGVdL5wE0sK0J8bDikok+NeoOG3X1Ebe4tYN
	9IL2MPTpHWD//j1A1p8huvxc4/2yHJhkP76nM8FpAncgdx6lzkWau7oAnjpSq8kydox0oxl+rwW
	7Nio8Tcm7hTm4FVtOY4TbT9WL33DEZ8DhhBFtaXBXUbYteZTfIZc5LgYQ38G78XwwnhHrbNzUau
	Ylx12zBTUXcwfcifvPJoCbodClR+OJPPPa8p2XPTzg3Q/vzk246HrnmX/jWf9WdPaNEM80WjhjB
	hntMISsudQ2D/qM0Mv4zF6fQ==
X-Received: by 2002:ac8:584e:0:b0:4f1:b9be:5111 with SMTP id d75a77b69052e-50752982bfcmr7393061cf.48.1772144205912;
        Thu, 26 Feb 2026 14:16:45 -0800 (PST)
Received: from [104.39.103.200] ([104.39.103.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf658f70sm302515685a.7.2026.02.26.14.16.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 14:16:45 -0800 (PST)
Message-ID: <d10eed82-c676-46e0-a126-b0aa5691d9df@gmail.com>
Date: Thu, 26 Feb 2026 17:16:45 -0500
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-mips@vger.kernel.org
Cc: tsbogend@alpha.franken.de
From: Dingisoul <dingiso.kernel@gmail.com>
Subject: Question about gio_bus release function in sgi-ip22-gio
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-13252-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dingisokernel@gmail.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CBEAD1B0442
X-Rspamd-Action: no action

Dear maintainers,

I have a question regarding the sgi-ip22-gio implementation
in the MIPS kernel.

`gio_bus` is declared as a static struct device variable.
However, its release function calls kfree() on the device
pointer, which would free a statically allocated variable —
an undefined behavior:

     static void gio_bus_release(struct device *dev)
     {
         kfree(dev);
     }

     static struct device gio_bus = {
         .init_name = "gio",
         .release   = &gio_bus_release,
     };

My concern is that this could become an actual problem in
`ip22_gio_init`. If `device_register()` fails, `put_device()`
is called, which decrements the refcount to zero and triggers
the release function:

     static int __init ip22_gio_init(void)
     {
         unsigned int pbdma __maybe_unused;
         int ret;

         ret = device_register(&gio_bus);
         if (ret) {
             put_device(&gio_bus);
             return ret;
         }
         ...
     }

Could this result in undefined behavior if the registration
ever fails? Would it make sense to provide a no-op release
function instead, given that `gio_bus` is statically allocated?

Thank you for your time and consideration.

Best regards,

Rubio


