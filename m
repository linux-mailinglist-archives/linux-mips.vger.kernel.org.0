Return-Path: <linux-mips+bounces-5707-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 909D39885BA
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2024 14:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0B361C2108F
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2024 12:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DF5F18C903;
	Fri, 27 Sep 2024 12:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ytYUaVYa"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14AB16D9AA
	for <linux-mips@vger.kernel.org>; Fri, 27 Sep 2024 12:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727441746; cv=none; b=JwFXlhfBXw9+OomfWrFNvpEjVuT7JHh46vdZ7XlwN9exH6yPlY4V1E9L/t52JmIR3suv49IRscf4A5XcrOpR7Ekygp0N9gRJrri/+rUewDohpDei5719YUrkI1h8xs0ASR21Rkbbm7g9fH5Dilcfh6V9fc2auFbck8ExqVHCZSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727441746; c=relaxed/simple;
	bh=qLD+K+EM+QykrR5wQ4RFPkwTk68QeSkZLe8HWKzj8KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AtcyTH/O5N4E+S3ALowMNQ0mZ1i8+2Z5+5LeFPdwnV+21ez7uJGMDFK0AK5nkyy1nRBrvscx1P0FYANsni7EhP+1G3DKxVBLLAlWLUa8mi2YTItQYf1vP6SvbyNamQxCFdca3pgCTbysiIevhaKM8BDCIxkt87VL4VaFnt3I45A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ytYUaVYa; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42cd46f3a26so18108515e9.2
        for <linux-mips@vger.kernel.org>; Fri, 27 Sep 2024 05:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727441743; x=1728046543; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7G1zAS3+0h+YAHD5sa1v09s7BPxHMz7BLX9PumSuY2E=;
        b=ytYUaVYadaagnhXQXmHKm+hvF2GFewWy+fbxIvBbMpHdp1gmaytVFMVgY2kMs1hJ0w
         E5vQN4nhpEMxDzDXItmBs7bEiyPM0cieZqKF5Tp58PPtlKRGDKAhfvPwGpGThVzkEYW6
         yP9/qbhoxIZW7EocbSyoRvttMXLz4v/p4gjs5PnoTBW5zbUQX1vlP1opphsvTDKPmvVi
         urZqvGm94E2e/My8QI2VNFuyh/uqQ9HG0oP8oF0tMqTDguXBdVjaay7qi764kEINVrxZ
         gR7zhM+V8yufgb+YkzUwfPdKBj0JmMxg6TAVeGLJzt4EPs5Zo/P6UyhgQoHF1nPq8PaR
         XZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727441743; x=1728046543;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7G1zAS3+0h+YAHD5sa1v09s7BPxHMz7BLX9PumSuY2E=;
        b=a0SqQJxByEcm9QT7Og6qDwM/FZhn6pH6HiJ/MZCw8XJR6YnpagDwgUJIOqSmDDW0gf
         e79C1PDjdTTEqA2UyUHJPJa070CvMHOIAnDxS6va7+mrhp031QDIR1NZYQPDl9eimYyV
         xv+CndbmL/7QwS1BPilVOWbb+5jnoRKcuE1n6rjEwJX/+CIsGo5ZbGAZkfQrLcEymONz
         6HKZTk2gyD1v8X6sKMqYtJM9xdX5kycl1xeUusAuw3UU7CQiM5hEuSgKH4S+YjheW+0C
         BD2EsdKY9CgP8OdLqnHBPWRQ1vMf1DOBb8spcCCY2aYaUG5fDEoQvEO5YC+6ZlQKbAtg
         R+1A==
X-Forwarded-Encrypted: i=1; AJvYcCXYupWOcL7DePdFS/DqAED9xcCw/f0qziJOGztDxi9yrlG+q9W4v4UijUdvYkiMpxA1STsJKZBPYM5T@vger.kernel.org
X-Gm-Message-State: AOJu0YwgYqxiziuT4t94AJdNUOwatpfZgi5qN5d+0Kagf9a00dMIN0Vf
	FecKlNYME3SeYRPeYd9GSXqfORPfHVjyiXcDUz5vUz88lIqHJaAv2WZYc41ATvkFxSyLY+JGKV/
	u
X-Google-Smtp-Source: AGHT+IHZ2qaUlhcJ/Zvsw3e63WKCE7ik2WTtg8XEqVxItlGGuypG5O6MgmsUgczWrnsoAMdw021MyQ==
X-Received: by 2002:a05:600c:5642:b0:42c:c401:6d8b with SMTP id 5b1f17b1804b1-42f5840cfe0mr22744985e9.7.1727441743165;
        Fri, 27 Sep 2024 05:55:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969f1a76sm73331375e9.12.2024.09.27.05.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 05:55:42 -0700 (PDT)
Date: Fri, 27 Sep 2024 15:55:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bugspray Bot <bugbot@kernel.org>
Cc: linux-hams@vger.kernel.org, helpdesk@kernel.org, macro@orcam.me.uk,
	konstantin@linuxfoundation.org, linux-mips@vger.kernel.org
Subject: Re: Bouncing maintainer: Ralf Baechle
Message-ID: <f74c4234-a091-4cc3-b92b-469f506c16a5@stanley.mountain>
References: <20240925-flashy-innocent-goat-afdbe8@lemur>
 <20240925-b219325-df57a5dbcddf@bugzilla.kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925-b219325-df57a5dbcddf@bugzilla.kernel.org>

On Wed, Sep 25, 2024 at 03:30:26PM +0000, Bugspray Bot wrote:
> Hello:
> 
> This conversation is now tracked by Kernel.org Bugzilla:
> https://bugzilla.kernel.org/show_bug.cgi?id=219325
> 

This bug is Access Denied.  No need for an email when the bug is private.

regards,
dan carpenter

