Return-Path: <linux-mips+bounces-4902-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E2158951C7C
	for <lists+linux-mips@lfdr.de>; Wed, 14 Aug 2024 16:04:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67A3EB2742C
	for <lists+linux-mips@lfdr.de>; Wed, 14 Aug 2024 14:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1571B1511;
	Wed, 14 Aug 2024 14:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d+76BRGJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275B919FA8C
	for <linux-mips@vger.kernel.org>; Wed, 14 Aug 2024 14:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723644237; cv=none; b=tLCa5wjYf9hdcooZZXsXyvH+cfDV6GRCLLSwDB2BOeaJOpn7jGBEWxp1q9ijohlczF+O2GKMNAL3qC6I5UEu1L2u1wjCW1FCqUJNlNCPjC5bFETy5ZgsoZvNs5aB9iz7DTcSQVK87+UJ0rUJvKlmzSDBWYPZCjmJGkrJYFq4mT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723644237; c=relaxed/simple;
	bh=sFqajaOq6D4jAC3KzZm6vpITRtjNz0zfxEilItFJwDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U46bHClvYmw655grZ0dvqON7/varVh7z0/Wei4vvW59U7INPD4SD+M2knYotzeqXza/alQaISq2pFtBOsAxrc/qDREPzyJ4we8b/Ew3/usRDyrpIYfTWLV9kjqjVlQmySrK3LUs9SWmeXBBD6jt/WNLLGQ2GQjgIy4+zV3xj0b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d+76BRGJ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-367940c57ddso3974855f8f.3
        for <linux-mips@vger.kernel.org>; Wed, 14 Aug 2024 07:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723644234; x=1724249034; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xu00BH1tYLGXlgpztypgE3nYTD9xbwKeTazRu7lO9fg=;
        b=d+76BRGJzeTQPxHrfuJWoCF3Z1vnV03aS/+R6OCGGxub0WtWmG3Jlwoaj2HCMBukS4
         2AhrS7ATvUaCf7y0IIco7cEZ0hVmdtbGBszEbQiVcPgaHnsnbmwtKLnPOCk/Mj5UOlnK
         8iC8WB122vJEVd4HJ2NN0bwQZsISSDwrwOAycvzwx/suQIMkUilVbATGhbRZCJSouNxx
         9Oiyb9cm+UHIoejLTk7aDXC6MO5gy2hf248zDOPlVyLC6fImdMsuCB1GwqGCEt8UNM9i
         8EWDZaZ5d0Lms8afqbDLtJg3f/+gVBR4S26+Ma5JTi0ogg8Qy3DZmmhnWSdXSjsg8503
         bbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723644234; x=1724249034;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xu00BH1tYLGXlgpztypgE3nYTD9xbwKeTazRu7lO9fg=;
        b=o69fzjiJaHRBX0f75NYctgLmKZMShP557a4h/l5bUwV6/lh7GCUyYEy26lqWP0c7cY
         /cNJz6JIQfCl1Y6p0TACadiyXRBT95tdEXqk3LmMSkRzZ03BdqKglvbyqEbStSCFtUEj
         16ohFUfReB8NfBC7J4kGpduklBsZTmVjO3sgSsnfyuX8SxEdZ+u+q75TSP4Y+y3d8xji
         91BGDf5YIl62qgk3819aDtbzfHe2zd84lwLK9FkTIozRs6j0ldc0lSniNaBIEKkO6Pd7
         xBRXyh8nRovDCSF2JJ3Rgth8pMLYjNkrPKEMyjmEH3Gd3CBYFur1pszMHQ018EIFAcCX
         5tWw==
X-Gm-Message-State: AOJu0Yy1YfsrOdt9EjY+AIIURRrL60Pm29K6BylmdleLv91GBM2rbDY6
	nO3tlrwCVDqbgFCAuOt7dINeQyqiFP/SmKhwii1mFrIgqP+3e4iRMFyhdUvM/18=
X-Google-Smtp-Source: AGHT+IH29hsq6r/LwoZs2dIlN85FdAtKj7mj066F/AVMSfI8NtAKhHDCzxXqfmsFOn/lJMVJDUvTuQ==
X-Received: by 2002:adf:fb06:0:b0:36b:a3f1:eb with SMTP id ffacd0b85a97d-371778083fdmr1807628f8f.53.1723644234216;
        Wed, 14 Aug 2024 07:03:54 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.208.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4ecc7ab6sm12826348f8f.104.2024.08.14.07.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 07:03:53 -0700 (PDT)
Message-ID: <f1a485d0-00e2-4eb8-a7e3-f5ed3f51678a@linaro.org>
Date: Wed, 14 Aug 2024 16:03:48 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] mips/jazz: remove unused jazz_handle_int()
 declaration
To: Gaosheng Cui <cuigaosheng1@huawei.com>, tsbogend@alpha.franken.de,
 javierm@redhat.com, arnd@arndb.de, dinguyen@kernel.org
Cc: linux-mips@vger.kernel.org
References: <20240814103739.2053421-1-cuigaosheng1@huawei.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240814103739.2053421-1-cuigaosheng1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14/8/24 12:37, Gaosheng Cui wrote:
> The jazz_handle_int() has been removed since
> commit e4ac58afdfac ("[MIPS] Rewrite all the assembler interrupt
> handlers to C."), so remove it.
> 
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>   arch/mips/jazz/setup.c | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



