Return-Path: <linux-mips+bounces-2735-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C38A8A2605
	for <lists+linux-mips@lfdr.de>; Fri, 12 Apr 2024 07:53:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D5ED1F2223E
	for <lists+linux-mips@lfdr.de>; Fri, 12 Apr 2024 05:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C1871BF24;
	Fri, 12 Apr 2024 05:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PCQQZ77F"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD43A405F2
	for <linux-mips@vger.kernel.org>; Fri, 12 Apr 2024 05:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712901188; cv=none; b=Wh8HQRHOL4hB8ypKHH4RF1evnSiFbjWm7xXbwVEQmDIDw7LJnosIqKdev9lLU3UeTngulxmGEun9besuWwBCJmHNz0+pwwgGzvQ91MXsvS9DLDMloUwdQPlHOC26WBy6FpptmraMCRLzXenb/Icbef7kBO6v/hJAMEhtsjFYisc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712901188; c=relaxed/simple;
	bh=kKC3RrxFxknaxrvhq4qeP1Dczf4ZA6SkEXqm4Bx5Fnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LIcHuUBSX+yd5YNlLSWcbDFy/6f+zBpmapsjVi6W50pvZP0Rlnev8k5ZTJmzCzT3T2ebJz6nFL5aCNbdTp6uUvlaVSUK7YzidnRjF+2SoJ+2qybH+F0rYA1lTrLJXRKnNEl4G//8HVjEJfP8Eg/Ech1l032uolgyYgyEtgSl5Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PCQQZ77F; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6ecf3943040so534934b3a.0
        for <linux-mips@vger.kernel.org>; Thu, 11 Apr 2024 22:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712901186; x=1713505986; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5qirefqt7ucvcNTfMY6oB/40vUrTXy+GUnpi/Nyrbl4=;
        b=PCQQZ77FpKQ3QEusPwDxSBUpzbE5x+gO5ewnLIBX451sNGb56iNFPEcyckPsUZXa3y
         qFIOkcpe+9AO6qY372qCnY3rxLAYk4/eIy5NDIXREZD903EcA3Lu1dZr8sousyq/SBcL
         ycCOktW0sStlgkimRIKuaVl4DjvqWqgzFF2CPlAxH5NfkH+ReToapy8ks2dkAI6peIwV
         HxfdJE0m0/vfpouE3Xs3X79QbY9mhi8NeMrND8PsocuOC4gkVkErk+7lkDQ44nehiBD9
         NHkCZMqqxoUJSXjezRxcUr9N/8tV5s8iOwmz9I3Ol7pfO31VvgZLHJ1pFcmaKN4yJyWk
         vRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712901186; x=1713505986;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qirefqt7ucvcNTfMY6oB/40vUrTXy+GUnpi/Nyrbl4=;
        b=i8js2iSSRt1uOvodkyeHnIgdJlbfuJ6rInZuABhyl6PD+ub7FE1h6prfoitrHqe66F
         gNl+n4MBX0mZL384rNB9oBufq5KleGPoTev9C71l7YE1UFvKHMIVWEhWdWiTMR/E42ly
         B9pR5kbM8yXgxqQyC+O2vgyOm2yx6OKgwuWpOQ9iE4MBkvyVqkJNVBWtqosUcqoPuhxu
         hrXO9t5ago27e7uNAAn3RVXOu5ngZSRdb4naMAG4JNO/zlliTg8a29PqYzHaF7H39Gqx
         qNnUOigOMRCsLpTvTzhi9jnKxEPcvWFGmoH9Jk3ASmvKFh6GxHPh4gABnT87d4vMQx68
         aZMA==
X-Forwarded-Encrypted: i=1; AJvYcCVEv0m/xHqLLvWHF1kcWoSLTA5VqIMSyPXcOsY14MF67g3ew+DowFH6Sj2KmHieKxJxb3uWh3dR6ZavAt8QkcxCwBOTJOHAG9ZqTw==
X-Gm-Message-State: AOJu0YzfrVUz50nzskWVx9dN/OlZd3JmZhLG+kReSl3jZaPKvD/2oB3+
	dwMsO1j8h4epxqxCxH1SDZqv7l1AJHnupB3BJB6YHg5NvSPT1zWkZoSJ9VkL3e8=
X-Google-Smtp-Source: AGHT+IFdcb6fggwQuac+bKV6y0/ANaeh5og7Qi32ngzvy+ulFf+Mx9HtoJWmvzOORv/SzxpZWijUIA==
X-Received: by 2002:a05:6a00:3986:b0:6ee:1d68:d33 with SMTP id fi6-20020a056a00398600b006ee1d680d33mr2112142pfb.15.1712901185961;
        Thu, 11 Apr 2024 22:53:05 -0700 (PDT)
Received: from localhost ([122.172.85.136])
        by smtp.gmail.com with ESMTPSA id h10-20020a63e14a000000b005f3c5cf33b5sm2057415pgk.37.2024.04.11.22.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 22:53:05 -0700 (PDT)
Date: Fri, 12 Apr 2024 11:23:03 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: lizhe <sensor1010@163.com>
Cc: christophe.leroy@csgroup.eu, naveen.n.rao@linux.ibm.com,
	axun.yang@flygoat.com, rafael@kernel.org, linux-pm@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH] cpufreq: Remove redundant exit() functions
Message-ID: <20240412055303.p32ssort5ir5yq3q@vireshk-i7>
References: <20240409141909.4413-1-sensor1010@163.com>
 <1355118777.446339.1712756972631.JavaMail.root@mail-tracker-145-3ep34-c9h23-5f64cf7787-82gdh>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1355118777.446339.1712756972631.JavaMail.root@mail-tracker-145-3ep34-c9h23-5f64cf7787-82gdh>

On 10-04-24, 21:49, lizhe wrote:
> 
> 
> 
> Hi, 
>      I have already tested it, it is functioning properly, Please review. 

Please don't expect reply within a day from maintainers. Give at least two weeks
before posting another email to remind people.

-- 
viresh

