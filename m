Return-Path: <linux-mips+bounces-2092-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEF38729C8
	for <lists+linux-mips@lfdr.de>; Tue,  5 Mar 2024 22:55:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A84E228855D
	for <lists+linux-mips@lfdr.de>; Tue,  5 Mar 2024 21:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D1D12D1E5;
	Tue,  5 Mar 2024 21:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b="jf/buExa"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B5612BF34
	for <linux-mips@vger.kernel.org>; Tue,  5 Mar 2024 21:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709675709; cv=none; b=iLQxBdg2O54LeS9Fq8/a9mgR3A6DnhQL9p4hq3kp/eOE20VfrIKpQPKQfLGQtNBUG+47S9QfQfdyP1R9cA5BSBOZXEzELHEKYj2JS6rms2Al9zqZjVmaVbUdoxl9fL6aqwt3wbVp37GJ7NshJ+ALwMHjykOQw6jp2NBd9DAqqF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709675709; c=relaxed/simple;
	bh=h9sa7Dchu6Y4OGHI9oq7OqF0wGe96fcS2Tveig7CW4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I+avHevsowDCvH2P6X44rMB7dtsG8ibhGxmAAufAgma63EOHimkFfaqz0Bw7gouLAZ6Cz1AAuBLVXMCCyRZ7BOCx5sEGKbLpoLQSwmEppdH0yL1pTmhn8cvSR3KCryeIcSZMFhAIU9ZqceIV0R03TbxfV0+ArftPB8n4OwiZ9Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b=jf/buExa; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1dd01ea35b5so20187515ad.0
        for <linux-mips@vger.kernel.org>; Tue, 05 Mar 2024 13:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20230601.gappssmtp.com; s=20230601; t=1709675707; x=1710280507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jL7LWnaopqqB5nwV+btClF0x89yXnbnHF4XK+f8SkuU=;
        b=jf/buExaxblTiNX6U0KWkwLuiRLT1GJXW3PzcId0FEqIhUZc+U+l2XzUcfdU9f6U6H
         eZ6qS1OUgpN/Mi4QPCl/TlC/tsBXKDqUNBSCjLdA7D50BHAGjnFQh2ix70Ug8ajZv6LI
         2BQUhIzS23rqqQg2whV7l1x61HCglhHbd1mQT1U9nhm4xXnHBKo+Wl+b/TIqdAozeFdm
         E2u7RWG+/3U7OornAB6tVlfx51bL+8mkviKOPToTq4R77g8EHmSsbYSw1Jvb8f5Il52f
         b6OqjxnXlO6F2LUG7iEiWuIff+Ytpq8yZfTGC14LfVk6UpugN1GuFJFhugvtcEuuEhi3
         2tZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709675707; x=1710280507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jL7LWnaopqqB5nwV+btClF0x89yXnbnHF4XK+f8SkuU=;
        b=Z2r08U1m47+MbmxPmtKo4uEFytO6vCj7nwhYm1rLaF4gchJvfM/kg5HoQEjF3AKT4n
         cJgeoXjXC+nPmOGm2WCqfoGqjbcHbU95T9AWVspwBlvKo0P+zlTQ/l+k82WgIVOCfUue
         L5iba0GXCDqiTA3OQbJIsMvJSeyqPCS0KkCx5g74zbN3Ogtik1BYK1au0mivj5aYmpGj
         PHX0Lj0KbgVudEoVDNpDnKLkY0N+SW5m1SOWp5MITxAZkLlpDGhv6vRmfm7PuVoNabBI
         G1L3WWC2kV4k1abjF4AWRswyLOBemeo4igYNz+DDIB0OcC53W3eJjpD+iGUKuqepWJne
         wg9g==
X-Forwarded-Encrypted: i=1; AJvYcCWJPRHoO3e0r7ggPa3oVtJLzRf/5bIPZqc+wvfvhHLBtgOGl1zZK/mrP+vPKbtT7pqXL0XUQmXPDEYA71Z/etbaio34L/X6jFwZcA==
X-Gm-Message-State: AOJu0YwFHl19opu0FoYOg4yB6MnKAUB9CT3ngJxyF1lAt1/qw56PgjGw
	0XewpBS6zAdfzgCh5mjOK5Ek0wTQN/ukHP+5YYH97FqYTRGyRVwpdjftCB5QNko=
X-Google-Smtp-Source: AGHT+IEzUHguUj9gf1hY/ZH3iwQaSPj6FKRjbFS32/33ns0rokMOZjx9/UvRjY93Qc1WGHn/9lMP2w==
X-Received: by 2002:a17:902:aa86:b0:1dc:cb04:82e8 with SMTP id d6-20020a170902aa8600b001dccb0482e8mr2800530plr.22.1709675706778;
        Tue, 05 Mar 2024 13:55:06 -0800 (PST)
Received: from ?IPV6:2a03:83e0:1256:2:c51:2090:e106:83fa? ([2620:10d:c090:500::7:4943])
        by smtp.gmail.com with ESMTPSA id w7-20020a170902e88700b001dba739d15bsm11097297plg.76.2024.03.05.13.55.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 13:55:06 -0800 (PST)
Message-ID: <1b57dac2-4b04-4bec-b2d7-d0edb4fcabbc@davidwei.uk>
Date: Tue, 5 Mar 2024 13:54:59 -0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next v6 02/15] net: page_pool: create hooks for
 custom page providers
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pavel Begunkov <asml.silence@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeelb@google.com>, Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>
References: <20240305020153.2787423-1-almasrymina@google.com>
 <20240305020153.2787423-3-almasrymina@google.com>
Content-Language: en-GB
From: David Wei <dw@davidwei.uk>
In-Reply-To: <20240305020153.2787423-3-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-03-04 18:01, Mina Almasry wrote:
> +struct memory_provider_ops {
> +	int (*init)(struct page_pool *pool);
> +	void (*destroy)(struct page_pool *pool);
> +	struct page *(*alloc_pages)(struct page_pool *pool, gfp_t gfp);
> +	bool (*release_page)(struct page_pool *pool, struct page *page);

For ZC Rx we added a scrub() function to memory_provider_ops that is
called from page_pool_scrub(). Does TCP devmem not custom behaviour
waiting for all netmem_refs to return before destroying the page pool?
What happens if e.g. application crashes?

