Return-Path: <linux-mips+bounces-7506-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25014A15DD1
	for <lists+linux-mips@lfdr.de>; Sat, 18 Jan 2025 16:54:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54E0F16281B
	for <lists+linux-mips@lfdr.de>; Sat, 18 Jan 2025 15:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8281B19CC11;
	Sat, 18 Jan 2025 15:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qPwVXFYi"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53071273F9;
	Sat, 18 Jan 2025 15:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737215638; cv=none; b=LfGiPdbniC+t8tSQbwgDfPXDKMdDZ8lTVcSQIxFOPwCtkFDXqQAX1N7+17eqnIcBpFKCvRCUGepRlJlWnD3bFT+gAMgFoq6e/WPA8a3brYY8mJmRc2sPvLH9aONeqDKFlhMLeix1khZwTd5ExlNjab2ywxPOlXp6vpPlNdenuPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737215638; c=relaxed/simple;
	bh=aExFjYm+4QWrDT9DkXy7sP7mK+3B+HOMmu7wGAWVtZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ANQusktabazqlUylsuRWx6Miu80+fxH/jYYmGdC73XqQ3DdKx07GTJjZuxqTVy/8nbG9apRtCSIGtt0G2UMENon97H8Ee8xdFA4ZluSHxhy1nyvxi38jbfyc5RdoSnujI2S9l/nLeNS6o3H4XECOLjwioDh5al2OsN9TaLY1yJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qPwVXFYi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D484C4CED1;
	Sat, 18 Jan 2025 15:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737215637;
	bh=aExFjYm+4QWrDT9DkXy7sP7mK+3B+HOMmu7wGAWVtZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qPwVXFYibmWGUzKh7cZIjqmeAOBAq/JvvInCzE0S+led7LTNGYFQnVsbKSj1E/y/n
	 NaIoDNjkIYztQxxS0g5wViJkR1bEBJQKPQYWWfbU4qOJEBf2QwaObRwlqNuZJqktZY
	 1TgYf2FyZzEnd/YWXZ3EuLKKuZe27kxvp18pntSF79TYcEAzJ8EscmHUVhECwi6IrC
	 DQ9n5Vx47VY5zZ5ZVHvBLkp1ZhpkIjy/+9Crob5t0CP3r4hPHlFgYtJkJyQAnIllO0
	 jFOW5rM3/jwNYN5aKCCBW7FmohEuYrCmy3vblmX8esMQ9BGGBJrmpl4pUY0bJKIugT
	 LmJP+HAGIXbWw==
Date: Sat, 18 Jan 2025 16:53:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-mips@vger.kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: Add Realtek ALC203 Codec
Message-ID: <20250118-solemn-skylark-of-culture-c51ccc@krzk-bin>
References: <20250115-loongson1-ac97-v1-0-2087b04dcd7f@gmail.com>
 <20250115-loongson1-ac97-v1-2-2087b04dcd7f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250115-loongson1-ac97-v1-2-2087b04dcd7f@gmail.com>

On Wed, Jan 15, 2025 at 07:03:08PM +0800, Keguang Zhang wrote:
> +maintainers:
> +  - Keguang Zhang <keguang.zhang@gmail.com>
> +
> +description:
> +  ALC203 is a full duplex AC97 2.3 compatible stereo audio codec.
> +

Missing $ref to dai-common.

> +properties:
> +  compatible:
> +    const: realtek,alc203
> +
> +  '#sound-dai-cells':
> +    const: 0

Best regards,
Krzysztof


